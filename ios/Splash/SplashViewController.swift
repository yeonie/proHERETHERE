//
//  SplashViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userEmailBox: UITextField!
    @IBOutlet weak var userPasswordBox: UITextField!
    @IBOutlet weak var loginOnOffBtn: UIButton!
    @IBOutlet weak var findEmailPW: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    
    
    
    
    let underline : [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 13.0),
                                                          .underlineStyle: NSUnderlineStyle.single.rawValue,
                                                          .foregroundColor: UIColor.white]
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValidEmail(emailBox: userEmailBox.text!) && userPasswordBox.text!.count > 4 {
            loginOnOffBtn.isEnabled = true
            if let image = UIImage(named: "loginBtn"){
                loginOnOffBtn.setImage(image, for : .normal)
            }
            
        } else {
            loginOnOffBtn.isEnabled = false
        }
        
        print(userEmailBox.text!, userPasswordBox.text!, range.location, range.length) // 이 부분은 확인을 위해 만든 부분입니다.
        return true
    }
    
    //네비게이션 바 투명
    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.setNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginOnOffBtn.isEnabled = false
        
        userEmailBox.delegate = self
        userPasswordBox.delegate = self
        
        
    
        
        
        
        //이메일, 비밀번호 찾기 밑줄 긋기
        //회원가입 밑줄긋기
        let underlineStringEmail = NSMutableAttributedString(string : "이메일/비밀번호 찾기", attributes: underline)
        let underlineStringSignIn = NSMutableAttributedString(string : "회원가입", attributes: underline)
        
        findEmailPW.setAttributedTitle(underlineStringEmail, for: .normal)
        signIn.setAttributedTitle(underlineStringSignIn, for: .normal)
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedPresentMainViewController(_ sender: UIButton) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            
            navigationViewController.pushViewController(MainViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
    }
    
    //노란색으로 바뀐 로그인 버튼 클릭할 경우
    @IBAction func pressedLogin(_ sender: UIButton) {
        MainDataManager().getLogin(self)
    }
    

    
    
    //회원가입 화면으로 이동.
    @IBAction func pressedRegisterBtn(_ sender: UIButton) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(putEmailViewController(), animated: true)
        }
    
    //비밀번호 찾기 화면으로 이동
    @IBAction func pressedPWBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(findPWputtingInfoViewController(), animated: true)
        
    }
    
    func isValidEmail(emailBox: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailBox)
    }
    
    
    
   

}
