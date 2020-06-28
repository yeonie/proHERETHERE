//
//  RegisterViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class putEmailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userEmailBox: UITextField!
    @IBOutlet weak var loginOnOffBtn: UIButton!
    
    
    
//    loginonof    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValidEmail(emailBox: userEmailBox.text!){
            loginOnOffBtn.isEnabled = true
            print("올바른 이메일")
            
        }else {
            loginOnOffBtn.isEnabled = false
        }
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmailBox.delegate = self
        
        loginOnOffBtn.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func dismissBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
    navigationViewController.pushViewController(SplashViewController(), animated: true)
        
    }
    
    @IBAction func pressedCompletedBtn(_ sender: Any) {
        MainDataManager().getEmailSignIn(self)
    }
    
    @IBAction func loginSuccessedBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(mainFeedViewController(), animated: true)
        
    }
    
    func isValidEmail(emailBox: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailBox)
    }
    

}
