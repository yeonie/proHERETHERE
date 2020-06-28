//
//  editMypageViewController.swift
//  ios
//
//  Created by 이동연 on 03/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class editMypageViewController: UIViewController {
    
    
    
    @IBOutlet weak var germanChoiceBtn: UIButton!
    @IBOutlet weak var swissChoiceBtn: UIButton!
    @IBOutlet weak var russiaChoiceBtn: UIButton!
    @IBOutlet weak var vietnamChoiceBtn: UIButton!
    @IBOutlet weak var taiwanChoiceBtn: UIButton!
    
    var swissbuttonActive = false
    var germanbuttonActive = false
    var russiabuttonActive = false
    var vietnambuttonActive = false
    var taiwanbuttonActive = false
    var underBarOnOff = false

    @IBOutlet weak var topbarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topbarView.layer.masksToBounds = false
        topbarView.layer.shadowColor = UIColor.black.cgColor
        topbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        topbarView.layer.shadowOpacity = 0.17
        topbarView.layer.shadowRadius = 3
        
        underDrawerStack.layer.cornerRadius = 10

        underDrawerStack.layer.masksToBounds = false
        underDrawerStack.layer.shadowColor = UIColor.black.cgColor
        underDrawerStack.layer.shadowOffset = CGSize(width: 1, height: 2)
        underDrawerStack.layer.shadowOpacity = 0.7
        underDrawerStack.layer.shadowRadius = 1.5
    }
    @IBOutlet weak var underDrawerStack: UIStackView!
    
    
    @IBAction func schollAuthentificationPressed(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(schoolAuthentificationCompletedViewController(), animated: true)
    }
    
    
    @IBAction func swissPressed(_ sender: Any) {
        swissbuttonActive = !swissbuttonActive
        if swissbuttonActive {
            swissChoiceBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            swissChoiceBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        
    }
    @IBAction func germanPressed(_ sender: Any) {
        germanbuttonActive = !germanbuttonActive
        if germanbuttonActive {
            germanChoiceBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            germanChoiceBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        
    }
    
    @IBAction func russiaPressed(_ sender: Any) {
        russiabuttonActive = !russiabuttonActive
        if russiabuttonActive {
            russiaChoiceBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            russiaChoiceBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        
        
    }
    @IBAction func vietnamPressed(_ sender: Any) {
        vietnambuttonActive = !vietnambuttonActive
        
        if vietnambuttonActive {
            vietnamChoiceBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            vietnamChoiceBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        
    }
    @IBAction func taiwanPressed(_ sender: Any) {
        
        taiwanbuttonActive = !taiwanbuttonActive
        
        if taiwanbuttonActive {
            taiwanChoiceBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            taiwanChoiceBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        
        
    }
    
    
    
    
    
    @IBAction func intersetedInFix(_ sender: Any) {
        
        underBarOnOff = !underBarOnOff
        
            UIView.animate(withDuration: 1.0, animations:({
                self.underDrawerStack.transform = CGAffineTransform(translationX: 0, y: -400)
            }))

    }
    
    @IBAction func interestedInFixed(_ sender: Any) {
        
        UIView.animate(withDuration: 1.0, animations:({
            self.underDrawerStack.transform = CGAffineTransform(translationX: 0, y: 400)
        }))
    }
    @IBAction func dismissBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func profileFixCompleted(_ sender: Any) {
        guard let navigationViewController = self.navigationController else{
            self.presentAlert(title: "오류", message: "화면이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(myPageFeedViewController(), animated: true)
        
    }
    
    
}
