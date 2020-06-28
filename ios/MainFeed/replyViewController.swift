//
//  replyViewController.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class replyViewController: UIViewController {

    
    @IBOutlet weak var replyFeedTableView: UITableView!
    @IBOutlet weak var topbarView: UIView!
    
    
    
    
    var replyFeedList : [replyFeed] = [replyFeed("risabe", "SeoulSouthKorea"), replyFeed("_litong","SeoulSouthKorea"), replyFeed("yoon_hh","SeoulSouthKorea"), replyFeed("yeoni_","SeoulouthKorea"), replyFeed("hwan_tube","SeoulSouthKorea"), replyFeed("saleamoon","SeoulSouthKorea")]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.replyFeedTableView.delegate = self
        self.replyFeedTableView.dataSource = self
        self.replyFeedTableView.rowHeight = 120;
        
        topbarView.layer.masksToBounds = false
        topbarView.layer.shadowColor = UIColor.black.cgColor
        topbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        topbarView.layer.shadowOpacity = 0.17
        topbarView.layer.shadowRadius = 3
        
        let replyFeedTableView = UINib(nibName: "replyFeedTableViewCell", bundle: nil)
        self.replyFeedTableView.register(replyFeedTableView, forCellReuseIdentifier: "replyFeedTableViewCell")
        
        
    }

}

extension replyViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "replyFeedTableViewCell", for : indexPath)as?
            replyFeedTableViewCell
            else{return UITableViewCell()}
        tableViewCell.updateUI(replyFeedList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return replyFeedList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            replyFeedList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
}



