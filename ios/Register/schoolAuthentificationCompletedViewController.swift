//
//  schoolAuthentificationCompletedViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class schoolAuthentificationCompletedViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var schoolImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedSchoolAuthentification(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(interestedRegionViewController(), animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            schoolImage.image = image
        }
    }

}
