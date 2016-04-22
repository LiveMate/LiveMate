//
//  SendBookRequestViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse
class SendBookRequestViewController: UIViewController {

    var artist: PFObject!
    
    @IBOutlet weak var sendRequestButton: UIButton!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var addressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        artistNameLabel.text = self.artist["artistName"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onSendRequestButton(sender: AnyObject) {
        let bookRequest = PFObject(className: "BookingRequests")
        bookRequest["eventAddress"] = addressTextField.text
        bookRequest["sender"] = PFUser.currentUser()
        bookRequest["receiver"] = artist
        
        bookRequest.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
