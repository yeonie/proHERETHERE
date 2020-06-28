//
//  myPageGalleryFeedViewController.swift
//  ios
//
//  Created by 이동연 on 27/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class myPageGalleryFeedViewController: UIViewController {

    @IBOutlet weak var topbarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topbarView.layer.masksToBounds = false
        topbarView.layer.shadowColor = UIColor.black.cgColor
        topbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        topbarView.layer.shadowOpacity = 0.3
        topbarView.layer.shadowRadius = 3

        // Do any additional setup after loading the view.
    }

    @IBAction func editMypagePressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(editMypageViewController(), animated: true)
        
    }
    
    @IBAction func feedwrotePressed(_ sender: Any) {
        
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)

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
