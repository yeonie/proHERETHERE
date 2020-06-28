//
//  registerNewFeedViewController.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class registerNewFeedViewController: UIViewController {
    
    @IBOutlet weak var feedPlusCollectionView: UICollectionView!
    @IBOutlet weak var interestedRegionTableView: UITableView!
    @IBOutlet weak var interestedInBtn: UIButton!
    @IBOutlet weak var interestedInScroll: UIScrollView!
    
    var buttonActive = false
    
    
    
    
    var InterestedRegionList : [InterestedRegion] = [InterestedRegion("대만"), InterestedRegion("독일"), InterestedRegion("영국"), InterestedRegion("러시아"), InterestedRegion("미국"), InterestedRegion("베트남"), InterestedRegion("프랑스"), InterestedRegion("북한")]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        interestedRegionTableView.delegate = self
        interestedRegionTableView.dataSource = self
        interestedInScroll.layer.cornerRadius = 6
        
        interestedInScroll.isHidden = true
        
        self.interestedRegionTableView.rowHeight = 40;
        
        
        let interestedRegionTableView = UINib(nibName: "interestedRegionViewControllerTableViewCell", bundle: nil)
        self.interestedRegionTableView.register(interestedRegionTableView, forCellReuseIdentifier: "interestedRegionViewControllerTableViewCell")

        // Do any additional setup after loading the view.
    }
    @IBAction func interestedInBtnPressed(_ sender: Any) {
        
        if buttonActive{
            interestedInScroll.isHidden = false
            
            UIView.animate(withDuration: 1.0, animations:({
                self.interestedInScroll.transform = CGAffineTransform(translationX: 0, y: 0)
                self.interestedInScroll.layer.masksToBounds = false
                self.interestedInScroll.layer.shadowColor = UIColor.black.cgColor
                self.interestedInScroll.layer.shadowOffset = CGSize(width: 1, height: 2)
                self.interestedInScroll.layer.shadowOpacity = 1
                self.interestedInScroll.layer.shadowRadius = 100
                //                self.backgroundColor.alpha = 0.5
            }))
        } else{
            interestedInScroll.isHidden = true
        }
        buttonActive = !buttonActive
    }
    

   

}
extension registerNewFeedViewController: UITableViewDelegate, UITableViewDataSource{
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


