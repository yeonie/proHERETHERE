//
//  myPageFeedTableViewCell.swift
//  ios
//
//  Created by 이동연 on 11/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class myPageFeedTableViewCell : UITableViewCell {
    
    @IBOutlet weak var topbarView: UIView!
    
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var userUpdatedImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        topbarView.layer.masksToBounds = false
        topbarView.layer.shadowColor = UIColor.black.cgColor
        topbarView.layer.shadowOffset = CGSize(width: 1, height: 2)
        topbarView.layer.shadowOpacity = 0.02
        topbarView.layer.shadowRadius = 1.4
    }
    
    
    
    func updateUI(_ myPagefeed : MyPageFeed){
        
        
        self.id.text = myPagefeed.id
    }
    
}



