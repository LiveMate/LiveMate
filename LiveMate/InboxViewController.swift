//
//  InboxViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/12/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

class InboxViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendButton(sender: AnyObject) {
        
        var message = PFObject(className:"Message")
        
        message["text"] = messageTextField.text
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print("The message has been saved")
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
