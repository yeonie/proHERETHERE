//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


class MainDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var newEmail : String?
    var newPassword : String?
    var rePassword : String?
    var name : String?
    var birth : String?
    var nickName : String?
    var InterestedRegionList : va_list?
    var schoolPicture : UIImage?
    var schoolName : String?
    var item : [String: Any]?
    
    
    
    func getTutorials(_ mainViewController: MainViewController) {        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/ads", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<TutorialResponse>) in
                switch response.result {
                case .success(let tutorialResponse):
                    if tutorialResponse.code == 100 {
                        mainViewController.titleLabel.text = tutorialResponse.message
                    } else {
                        mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
    
    //로그인 서버 + 화면전환
    func getLogin(_ loginViewController: SplashViewController){
        let email = loginViewController.userEmailBox.text!
        let password = loginViewController.userPasswordBox.text!
        let parameter = ["email": email, "password": password]
        Alamofire.request("\(self.appDelegate.baseUrl)/login", method:
            .post, parameters: parameter,
                   encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response: DataResponse<LoginResponse>) in
                switch response.result {
                case .success(let loginResponse):
                    if loginResponse.code == 101{
                        print("loginSuccess")
                        loginViewController.navigationController!.pushViewController(mainFeedViewController(), animated: true)
                        
                    }else if loginResponse.code == 506{
                        print("alert!")
                        
                        loginViewController.presentAlert(title: "holly...", message: loginResponse.message)
                    }
                    print(response)
                    break
                case .failure:
                    print(response)
                    
                }
            })
    }
    
    //회원가입 할 때 이메일 따오기
    func getEmailSignIn(_ putEmailViewController: putEmailViewController){
        let email = putEmailViewController.userEmailBox.text!
        let parameter = ["reqType": "0", "email": email]
        Alamofire.request("\(self.appDelegate.baseUrl)/signup", method:
            .post, parameters: parameter,
                   encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response: DataResponse<SignUpEmailResponse>) in
                switch response.result {
                case .success(let SignUpEmailResponse):
                    putEmailViewController.presentAlert(title: "", message: SignUpEmailResponse.message)
                    print(response)
                    break
                case .failure:
                    print(response)
                    self.newEmail = email
                    putEmailViewController.navigationController!.pushViewController(putPasswordViewController(), animated: true)
                    //loginViewController.presentAlert(title: "", message: "서버와의 연결이 원활하지 않습니다.")
                }
    })
    }
    
    
    //회원가입 할 때 비밀번호 받아오기
    func getPasswordSignIn(_ putPasswordViewController: putPasswordViewController){
        let password = putPasswordViewController.passwordBox1.text!
        let rePassword = putPasswordViewController.passwordBox2.text!
        let parameter = ["reqType" : "2", "password" : password, "rePassword" : rePassword]
        Alamofire.request("\(self.appDelegate.baseUrl)/signup", method:
        .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response : DataResponse<SignPasswordResponse>) in
                switch response.result{
                case .success(let SignPasswordResponse):
                    putPasswordViewController.presentAlert(title: "", message: SignPasswordResponse.message)
                    print(response)
                    break
                case .failure:
                    print(response)
                    self.newPassword = password
                    self.rePassword = rePassword
                    putPasswordViewController.navigationController!.pushViewController(putPersonalViewController(), animated: true)
                }
            })
    }
    
    
    //개인정보 3개 입력
    func getPersonalInfoSignIn(_ putPersonalViewController: putPersonalViewController){
        let name = putPersonalViewController.userName.text!
        let birth = putPersonalViewController.userBirthdate.text!
        let nickName = putPersonalViewController.userNickname.text!
        let parameter = ["reqType" : "2", "name" : name, "birth" : birth, "nickName" : nickName]
        Alamofire.request("\(self.appDelegate.baseUrl)/signup", method:
            .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response : DataResponse<SignUpPutPersonalResponse>) in
                switch response.result{
                case .success(let SignUpPutPersonalResponse):
                    putPersonalViewController.presentAlert(title: "", message: SignUpPutPersonalResponse.message)
                    print(response)
                    break
                case .failure:
                    print(response)
                    self.name = name
                    self.birth = birth
                    self.nickName = nickName
                    putPersonalViewController.navigationController!.pushViewController(schoolAuthenticationViewController(), animated: true)
                }
            })
    }
    
    //학교사진 첨부
    func schoolAuthentificationSignIn(_ schoolAuthenticationViewController: schoolAuthenticationViewController){
        let schoolPicture = schoolAuthenticationViewController.schoolImage.image!
        let parameter = ["reqType" : "2", "schoolPicture" : "schoolPicture", "schoolName": "한국항공대"]
        Alamofire.request("\(self.appDelegate.baseUrl)/signup", method:
            .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response : DataResponse<putSchoolImageResponse>) in
                switch response.result{
                case .success(let putSchoolImageResponse):
                    schoolAuthenticationViewController.presentAlert(title: "", message: putSchoolImageResponse.message)
                    print(response)
                    break
                case .failure:
                    print(response)
                    self.schoolPicture = schoolPicture
                    self.schoolName = "한국항공대"
                    schoolAuthenticationViewController.navigationController!.pushViewController(schoolAuthentificationCompletedViewController(), animated: true)
                }
            })
        
    }
    
    
    
    //관심지역 입력    <-- 아 근데 이 부분 어째해야할 지 모르것다. locationNo 리스트를 어째 넘겨줘야할지
    func InterestedInRegion(_ interestedRegionViewController: interestedRegionViewController){
        let item: [String: Any] = ["locationNo": "i+1"]
        let parameter = ["reqType" : "2", "locationNo" : "item"]
        Alamofire.request("\(self.appDelegate.baseUrl)/signup", method:
            .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).responseObject(completionHandler: { (response : DataResponse<InterestedRegionResponse>) in
                switch response.result{
                case .success(let InterestedRegionResponse):
                    if InterestedRegionResponse.code == 100{
                        print("SignUp Successed")
                        interestedRegionViewController.navigationController!.pushViewController(mainFeedViewController(), animated: true)
                    }else if InterestedRegionResponse.code == 500{
                        print("alert!")
                        interestedRegionViewController.presentAlert(title: "holly...", message: InterestedRegionResponse.message)
                    }
                    interestedRegionViewController.presentAlert(title: "", message: InterestedRegionResponse.message)
                    print(response)
                    break
                case .failure:
                    print(response)
                    self.item = item
                    interestedRegionViewController.navigationController!.pushViewController(registrationCompletedViewController(), animated: true)
                }
            })
        


//        let locationNo : [interestedRegionViewController.InterestedRegionList]
//        var InterestedRegionList : [InterestedRegion] = [InterestedRegion("대만"), InterestedRegion("독일"), InterestedRegion("영국"), InterestedRegion("러시아"), InterestedRegion("미국"), InterestedRegion("베트남"), InterestedRegion("프랑스"), InterestedRegion("북한")]
    }
    
    func SignUpCompleted(_ registrationCompletedViewController: registrationCompletedViewController){
        registrationCompletedViewController.navigationController!.pushViewController(mainFeedViewController(), animated: true)
    }
}
