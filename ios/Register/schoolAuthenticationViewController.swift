//
//  schoolAuthenticationViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class schoolAuthenticationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let imagePickerController = UIImagePickerController()

    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var putimageBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
        

        // Do any additional setup after loading the view.
    }
 
    @IBAction func AuthentificationCompletedBtn(_ sender: Any) {
        
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated : true, completion : nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            schoolImage.image = image
        }
        if let image = UIImage(named: "schoolcertify"){
            putimageBtn.setImage(image, for : .normal)
            MainDataManager().schoolAuthentificationSignIn(self)
        
            
            dismiss(animated: true, completion: nil)
    }
    }
}
