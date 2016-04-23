//
//  InboxTableViewCell.swift
//  LiveMate
//
//  Created by zeus medina on 4/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class InboxTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBOutlet weak var bookingRequestNameLabel: UILabel!
    
    @IBOutlet weak var statusOfBookingLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onAcceptButton(sender: AnyObject) {
        
    }
    
    @IBAction func onDeclineButton(sender: AnyObject) {
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
