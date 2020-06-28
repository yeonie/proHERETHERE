//
//  mainFeedViewController.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class mainFeedViewController: UIViewController {
    
    @IBOutlet weak var superview: UIView!
    @IBOutlet weak var mainFeedTableView: UITableView!
    @IBOutlet weak var hamburgerView: UIView!
    @IBOutlet weak var beforePressedHamburger: NSLayoutConstraint!
    @IBOutlet weak var backgroundColor: UIImageView!
    @IBOutlet weak var topbarView: UIView!
    @IBOutlet weak var underbarView: UIView!
    
    
    var underBarOnOff = false
    var choiceOnOff = false
    
    //스위치
    @IBOutlet weak var choiceAllSwitch: UISwitch!
    @IBOutlet weak var choiceSpainSwitch: UISwitch!
    @IBOutlet weak var choiceAmericaSwitch: UISwitch!
    @IBOutlet weak var choiceFranceSwitch: UISwitch!
    @IBOutlet weak var choiceVietnamSwitch: UISwitch!
    @IBOutlet weak var choiceTaiwanSwitch: UISwitch!
    
    //필터 담은 뷰
    @IBOutlet weak var filterFatherView: UIView!
    
    
    
    
    var hamburgerExpanded = false
    
    var FeedList : [Feed] = [Feed("risabe"), Feed("_litong"), Feed("yoon_hh"), Feed("yeoni_"), Feed("hwan_tube"), Feed("saleamoon")]
    
    //필터버튼
    @IBAction func filterBtn(_ sender: Any) {
        
        underBarOnOff = !underBarOnOff
        
        UIView.animate(withDuration: 1.0, animations:({
            self.filterFatherView.transform = CGAffineTransform(translationX: 0, y: -420)
            //필터 모서리 뭉툭
//            self.filterFatherView.layer.cornerRadius = 40
            //필터 그림자
            self.filterFatherView.layer.masksToBounds = false
            self.filterFatherView.layer.shadowColor = UIColor.black.cgColor
            self.filterFatherView.layer.shadowOffset = CGSize(width: 1, height: 2)
            self.filterFatherView.layer.shadowOpacity = 0.7
            self.filterFatherView.layer.shadowRadius = 100
            
            
        }))
    }
    @IBAction func filterCloseBtn(_ sender: Any) {
        
        UIView.animate(withDuration: 1.0, animations:({
            self.filterFatherView.transform = CGAffineTransform(translationX: 0, y: 420)
        }))
    }
    //메뉴 추가하기
    @IBAction func newFeedPressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(registerNewFeedViewController(), animated: true)
        
    }
    //로그아웃 btn
    @IBAction func logoutPrssed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(LougoutViewController(), animated: true)
        
    }
    //하단 바 스크랩북
    @IBAction func srapbookPressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myScrapbookViewController(), animated: true)
    }
    @IBAction func mypagePressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
    }
    
    //햄버거 메뉴
    @IBAction func hamburgerMenuPressed(_ sender: Any) {
        
        
        hamburgerExpanded = !hamburgerExpanded
        
        if hamburgerExpanded{
            UIView.animate(withDuration: 1.0, animations:({
           
                self.hamburgerView.transform = CGAffineTransform(translationX: 286, y: 0)
                self.hamburgerView.layer.masksToBounds = false
                self.hamburgerView.layer.shadowColor = UIColor.black.cgColor
                self.hamburgerView.layer.shadowOffset = CGSize(width: 1, height: 2)
                self.hamburgerView.layer.shadowOpacity = 1
                self.hamburgerView.layer.shadowRadius = 100
            }))
//            self.backgroundColor.backgroundColor = UIColor.darkGray
            
            
        }
        else{
            UIView.animate(withDuration: 1.0, animations:({
                self.hamburgerView.transform = CGAffineTransform(translationX: -286, y: 0)
                self.mainFeedTableView.backgroundColor = UIColor.darkGray
            }))
            self.backgroundColor.backgroundColor = UIColor.clear

        }
        
    }
    //햄버거 속 마이페이지
    @IBAction func myPagePressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
            
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
    }
    
    @IBAction func choiceAllOn(_ sender: Any) {
        choiceOnOff = !choiceOnOff
        
        if(choiceOnOff){
            choiceSpainSwitch.isOn = true
            choiceTaiwanSwitch.isOn = true
            choiceVietnamSwitch.isOn = true
            choiceFranceSwitch.isOn = true
            choiceAmericaSwitch.isOn = true
            choiceSpainSwitch.isOn = true
        }
        else{
            choiceSpainSwitch.isOn = false
            choiceTaiwanSwitch.isOn = false
            choiceVietnamSwitch.isOn = false
            choiceFranceSwitch.isOn = false
            choiceAmericaSwitch.isOn = false
            choiceSpainSwitch.isOn = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //그림자
        topbarView.layer.masksToBounds = false
        topbarView.layer.shadowColor = UIColor.black.cgColor
        topbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        topbarView.layer.shadowOpacity = 0.17
        topbarView.layer.shadowRadius = 3
        
        underbarView.layer.masksToBounds = false
        underbarView.layer.shadowColor = UIColor.black.cgColor
        underbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        underbarView.layer.shadowOpacity = 0.02
        underbarView.layer.shadowRadius = 1
        
        
        self.mainFeedTableView.delegate = self
        self.mainFeedTableView.dataSource = self
        self.mainFeedTableView.rowHeight = 230;
        
        self.backgroundColor.alpha = 0
        
        filterFatherView.clipsToBounds = true
        
        
        
        let mainFeedTableView = UINib(nibName: "mainFeedTableTableViewCell", bundle: nil)
        self.mainFeedTableView.register(mainFeedTableView, forCellReuseIdentifier: "mainFeedTableTableViewCell")
        
        //switch color
        choiceAllSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceAllSwitch.isOn = false
        choiceSpainSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceSpainSwitch.isOn = false
        choiceAmericaSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceAmericaSwitch.isOn = false
        choiceFranceSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceFranceSwitch.isOn = false
        choiceVietnamSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceVietnamSwitch.isOn = false
        choiceTaiwanSwitch.onTintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        choiceTaiwanSwitch.isOn = false
//        choiceAllSwitch.tintColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        
        
        
 

    }
    
    



}
extension mainFeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainFeedTableTableViewCell", for : indexPath)as?
            mainFeedTableTableViewCell
            else{return UITableViewCell()}
        tableViewCell.updateUI(FeedList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return FeedList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            FeedList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
}

