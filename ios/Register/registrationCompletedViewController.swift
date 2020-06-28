//
//  registrationCompletedViewController.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class registrationCompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func registrated(_ sender: Any) {
        MainDataManager().SignUpCompleted(self)
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
