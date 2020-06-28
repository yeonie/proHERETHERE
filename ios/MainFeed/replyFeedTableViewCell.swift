//
//  replyFeedTableViewCell.swift
//  ios
//
//  Created by 이동연 on 26/04/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class replyFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var userReply: UILabel!
    
    
    func updateUI(_ feed : replyFeed){
        
        
        self.id.text = feed.id
        self.userReply.text = feed.id
    }
    
}
