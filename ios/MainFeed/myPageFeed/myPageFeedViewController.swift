//
//  myPageFeedViewController.swift
//  ios
//
//  Created by 이동연 on 27/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class myPageFeedViewController: UIViewController {

    @IBOutlet weak var topbarView: UIView!
    @IBOutlet weak var hamburgerView: UIView!
//    @IBOutlet weak var myPageFeed: UITableView!
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var userGalleryView: UIView!
    @IBOutlet weak var userWordBtnColor: UIButton!
    @IBOutlet weak var userGalleryBtnColor: UIButton!
    @IBOutlet weak var myPageFeed: UIView!
    
    
    var hamburgerExpanded = false
    
    var MyPageFeedList : [MyPageFeed] = [MyPageFeed("_litong"), MyPageFeed("_litong"), MyPageFeed("_litong"), MyPageFeed("_litong"), MyPageFeed("_litong"), MyPageFeed("_litong")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userGalleryView.isHidden = true
        
//        myPageFeed.delegate = self
//        myPageFeed.dataSource = self
//
//        self.myPageFeed.delegate = self
//        self.myPageFeed.dataSource = self
//        self.myPageFeed.rowHeight = 230;
        
//        let myPageFeed = UINib(nibName: "myPageFeedTableViewCell", bundle: nil)
//        self.myPageFeed.register(myPageFeed, forCellReuseIdentifier: "myPageFeedTableViewCell")

//        topbarView.layer.masksToBounds = false
//        topbarView.layer.shadowColor = UIColor.black.cgColor
//        topbarView.layer.shadowOffset = CGSize(width: 1, height: 4)
//        topbarView.layer.shadowOpacity = 0.3
//        topbarView.layer.shadowRadius = 4
        
        
    }


    @IBAction func GalleryPressed(_ sender: Any) {
        
        myPageFeed.isHidden = true
        userGalleryView.isHidden = false
        userWordBtnColor.titleLabel?.textColor = UIColor.gray
        userGalleryBtnColor.titleLabel?.textColor = UIColor.blue
        
        
    }
    @IBAction func WordPressed(_ sender: Any) {
        
        myPageFeed.isHidden = false
        userGalleryView.isHidden = true
        userWordBtnColor.titleLabel?.textColor = UIColor.blue
        userGalleryBtnColor.titleLabel?.textColor = UIColor.gray
        userGalleryBtnColor.titleLabel?.highlightedTextColor
    }
    
    
    @IBAction func hamburgerPressed(_ sender: Any) {
        hamburgerExpanded = !hamburgerExpanded
        
        if hamburgerExpanded{
            self.userInfoView.alpha = 0
            UIView.animate(withDuration: 1.0, animations:({
                self.hamburgerView.transform = CGAffineTransform(translationX: 286, y: 0)
                self.hamburgerView.layer.masksToBounds = false
                self.hamburgerView.layer.shadowColor = UIColor.black.cgColor
                self.hamburgerView.layer.shadowOffset = CGSize(width: 1, height: 2)
                self.hamburgerView.layer.shadowOpacity = 1
                self.hamburgerView.layer.shadowRadius = 100
                //                self.backgroundColor.alpha = 0.5
            }))
            //            self.backgroundColor.backgroundColor = UIColor.darkGray
            
            
        }
        else{
            UIView.animate(withDuration: 1.0, animations:({
                self.hamburgerView.transform = CGAffineTransform(translationX: -286, y: 0)
                self.userInfoView.alpha = 0
                self.userGalleryView.alpha = 0
                self.myPageFeed.alpha = 0
                //                self.mainFeedTableView.backgroundColor = UIColor.darkGray
            }))
            
        }
    }
    
    @IBAction func mypageEditPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(editMypageViewController(), animated: true)
        
    }
    //햄버거 마이페이지
    @IBAction func myPagePressed(_ sender: Any) {
            guard let navigationViewController = self.navigationController else{
                self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
                return
                
            }
            navigationViewController.pushViewController(myPageFeedViewController(), animated: true)

    }
    @IBAction func hamburgerDismiss(_ sender: Any) {
        UIView.animate(withDuration: 0.7, animations:({
            self.hamburgerView.transform = CGAffineTransform(translationX: -286, y: 0)
            self.userInfoView.alpha = 1.0
            self.userGalleryView.alpha = 1.0
            self.myPageFeed.alpha = 1.0
        }))
    }
    @IBAction func homeBtnPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(mainFeedViewController(), animated: true)
    }
    
    @IBAction func bookmarkPressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myScrapbookViewController(), animated: true)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(LougoutViewController(), animated: true)
    }
}
//extension myPageFeedViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "myPageFeedTableViewCell", for : indexPath)as?
//            myPageFeedTableViewCell
//            else{return UITableViewCell()}
//        tableViewCell.updateUI(MyPageFeedList[indexPath.row])
//        return tableViewCell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return MyPageFeedList.count
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            MyPageFeedList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//            
//        }
//    }
//    
//}

