//
//  interestedRegionViewController.swift
//  ios
//
//  Created by 이동연 on 25/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class interestedRegionViewController: UIViewController {

    @IBOutlet weak var interestedRegionTableView: UITableView!
    @IBOutlet weak var interestedInBtn: UIButton!
    @IBOutlet weak var interestedInBtnImage: UIImageView!
    @IBOutlet weak var interestedInScroll: UIScrollView!
    @IBOutlet weak var choiceCompletedBtn: UIButton!
    
    var buttonActive = false
    
    
    
    
    var InterestedRegionList : [InterestedRegion] = [InterestedRegion("대만"), InterestedRegion("독일"), InterestedRegion("영국"), InterestedRegion("러시아"), InterestedRegion("미국"), InterestedRegion("베트남"), InterestedRegion("프랑스"), InterestedRegion("북한")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interestedRegionTableView.delegate = self
        interestedRegionTableView.dataSource = self
        interestedInBtnImage.layer.cornerRadius = 6
        interestedInScroll.layer.cornerRadius = 6
        
        interestedInScroll.isHidden = true
        
        self.interestedRegionTableView.rowHeight = 40;
        
        
        let interestedRegionTableView = UINib(nibName: "interestedRegionViewControllerTableViewCell", bundle: nil)
        self.interestedRegionTableView.register(interestedRegionTableView, forCellReuseIdentifier: "interestedRegionViewControllerTableViewCell")
        
    }
    //관심지역 선택하기 누르면
    @IBAction func interestedInBtnClicked(_ sender: Any) {
        
        if buttonActive{
            interestedInScroll.isHidden = false
        } else{
            interestedInScroll.isHidden = true
        }
        buttonActive = !buttonActive
    }
    
    
    
    
    @IBAction func pressedRegistrationCompleted(_ sender: Any) {
//        if let image = UIImage(named: "icChoiceCompleted"){
//            choiceCompletedBtn.setImage(image, for : .normal)
//        self.pressedRegistrationCompleted{
            MainDataManager().InterestedInRegion(self)
//        }
    }
}


extension interestedRegionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "interestedRegionViewControllerTableViewCell", for : indexPath)as?
            interestedRegionViewControllerTableViewCell
            else{return UITableViewCell()}
        tableViewCell.updateUI(InterestedRegionList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return InterestedRegionList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            InterestedRegionList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
}

