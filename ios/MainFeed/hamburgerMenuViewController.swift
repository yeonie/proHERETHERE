//
//  hamburgerMenuViewController.swift
//  ios
//
//  Created by 이동연 on 28/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class hamburgerMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mypagePressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
        
        
    }
    @IBAction func mypagePressedBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
        
    }
    
    @IBAction func mainFeedPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(mainFeedViewController(), animated: true)
    }
    
    
    @IBAction func dissmissBtn(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(mainFeedViewController(), animated: true)

    }
    
    //로그아웃
    @IBAction func logoutBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(LougoutViewController(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
