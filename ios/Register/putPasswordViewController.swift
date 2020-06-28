//
//  putPasswordViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class putPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordBox1: UITextField!
    @IBOutlet weak var passwordBox2: UITextField!
    @IBOutlet weak var choiceCompletedBtn: UIButton!
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if  passwordBox1.text!.count > 4 && passwordBox2.text!.count > 4 && passwordBox1.text!.count < 11 && passwordBox2.text!.count < 11 &&
            passwordBox1.text! == passwordBox2.text! {
            choiceCompletedBtn.isEnabled = true
            //에러가 나면 이 부분일듯
        }else {
            choiceCompletedBtn.isEnabled = false
        }
        return true
    }
    
    @IBAction func choiceCompletedPressed(_ sender: Any) {
        if(passwordBox1.text! == passwordBox2.text!){
            MainDataManager().getPasswordSignIn(self)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        passwordBox1.delegate = self
        passwordBox2.delegate = self
        
        choiceCompletedBtn.isEnabled = false

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedCompletedBtn(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(putPersonalViewController(), animated: true)
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
