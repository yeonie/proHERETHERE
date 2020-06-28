//
//  interestedRegionViewControllerTableViewCell.swift
//  ios
//
//  Created by 이동연 on 01/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class interestedRegionViewControllerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var unChoicedBtn: UIButton!
    
    var buttonActive = false
    
    
 
    
    func updateUI(_ interestedRegion : InterestedRegion){
        
        
        self.country.text = interestedRegion.country
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        unChoicedBtn.setBackgroundImage(UIImage(named: "apple"), for: .normal)
        // Configure the view for the selected state
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if buttonActive {
            unChoicedBtn.setImage(UIImage(named: "icUnchoiced"), for: .normal)
        } else {
            unChoicedBtn.setImage(UIImage(named: "icChoiced"), for: .normal)
        }
        buttonActive = !buttonActive
    }
    
    
}





