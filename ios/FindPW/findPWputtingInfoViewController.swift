//
//  findPWputtingInfoViewController.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class findPWputtingInfoViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userEmailBox: UITextField!
    @IBOutlet weak var userNameBox: UITextField!
    @IBOutlet weak var userBirthBox: UITextField!
    @IBOutlet weak var putCompleted: UIButton!
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValidEmail(emailBox: userEmailBox.text!) && userBirthBox.text!.count > 4 {
            putCompleted.isEnabled = true
            if let image = UIImage(named: "icFindPWBtn"){
                putCompleted.setImage(image, for : .normal)
            }
            
        } else {
            putCompleted.isEnabled = false
        }
        
        print(userEmailBox.text!, userNameBox.text!, range.location, range.length) // 이 부분은 확인을 위해 만든 부분입니다.
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        putCompleted.isEnabled = false
        userNameBox.delegate = self
        userBirthBox.delegate = self
        userEmailBox.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func puttingCompletedBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(temporalPWSentViewController(), animated: true)

    }
    
    func isValidEmail(emailBox: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailBox)
    }


}
