//
//  myScrapbookViewController.swift
//  ios
//
//  Created by 이동연 on 05/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class myScrapbookViewController: UIViewController {

    
    var hamburgerExpanded = false
    
    
    @IBOutlet weak var backgroundColor: UIImageView!
    @IBOutlet weak var hamburgerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //로그아웃 눌렀을 경우.
    @IBAction func logoutPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(LougoutViewController(), animated: true)
    }
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
//                self.backgroundColor.alpha = 0.5
            }))
//            self.backgroundColor.backgroundColor = UIColor.darkGray
            
            
        }
        else{
            UIView.animate(withDuration: 1.0, animations:({
                self.hamburgerView.transform = CGAffineTransform(translationX: -286, y: 0)
//                self.mainFeedTableView.backgroundColor = UIColor.darkGray
            }))
            self.backgroundColor.backgroundColor = UIColor.clear
            
        }
    }
    
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(mainFeedViewController(), animated: true)
    }
    
    @IBAction func hamburgerDismissBtn(_ sender: Any) {
        
        UIView.animate(withDuration: 0.7, animations:({
            self.hamburgerView.transform = CGAffineTransform(translationX: -286, y: 0)
        }))
        self.backgroundColor.backgroundColor = UIColor.clear
    }
    
    @IBAction func mypagePressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
        
        
    }
    

}
