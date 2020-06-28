//
//  putPersonalViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class putPersonalViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userBirthdate: UITextField!
    @IBOutlet weak var userNickname: UITextField!
    @IBOutlet weak var leastCountLabel: UILabel!
    @IBOutlet weak var personalInfoPutCompletedOnOff: UIButton!
    
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if userName.text!.count<=1 || userBirthdate.text!.count<=3 || userNickname.text!.count<=3{
            if userBirthdate.text!.count<=3{
                if userNickname.text!.count<3{
                    leastCountLabel.isEnabled = true
                    personalInfoPutCompletedOnOff.isEnabled = false
                    print("세 가지 정보를 모두 입력해주세요")
                }
            }
        }
        else{
            leastCountLabel.isHidden = true
            personalInfoPutCompletedOnOff.isEnabled = true
        }
        
        print(userName.text!, userBirthdate.text!, userNickname.text!, range.location, range.length) // 이 부분은 확인을 위해 만든 부분입니다.
        return true
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalInfoPutCompletedOnOff.isEnabled = false
        
        userName.delegate = self
        userBirthdate.delegate = self
        userNickname.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedCompletedBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(schoolAuthenticationViewController(), animated: true)
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
