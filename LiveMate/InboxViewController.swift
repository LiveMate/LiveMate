//
//  InboxViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/12/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

class InboxViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var data: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:
            "callParseBackendForBookingRequests", userInfo: nil, repeats: true)
    
        
    }
    
    
    func callParseBackendForBookingRequests() {
        let query = PFQuery(className: "BookingRequests")
        if let user = PFUser.currentUser() {
            if (PFUser.currentUser()!["isArtist"] as! Bool == false) {
                query.whereKey("sender", equalTo: PFUser.currentUser()!)
            } else {
             query.whereKey("receiver", equalTo: PFUser.currentUser()!["artistReference"])
            }
        } else {
            //User has attempted logout so to avoid this crashing we check if currentuser exists
        }
        query.includeKey("sender")
        query.includeKey("receiver")
        query.orderByDescending("createdAt")
        query.limit = 5
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) ->
            Void in
            
            if let media = media {
                
                self.data = media
                self.tableView.reloadData()
                
            }
            else {
                if let error = error {
                    NSLog("Error:\(error)")
                }
                
            }
        }
        
    }
    
    //Code below handles filling of tableview data
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (data != nil) {
            return data!.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InboxTableViewCell", forIndexPath: indexPath) as! InboxTableViewCell
        cell.bookRequest = data?[indexPath.section]
        
        if (PFUser.currentUser()!["isArtist"] as! Bool == false) {
            cell.acceptButton.hidden = true
            cell.declineButton.hidden = true
            if (data?[indexPath.section]["receiver"] != nil) {
                let artistName = data?[indexPath.section]["receiver"]["artistName"]
                cell.bookingRequestNameLabel.text = artistName! as! String
            }
            
        } else {
            let senderName = data?[indexPath.section]["sender"]["username"]
            cell.bookingRequestNameLabel.text = "From" + (senderName! as! String)
        }
        
        /*
        if (data?[indexPath.section]["headerImage"] != nil) {
            let imageFile = data?[indexPath.section]["headerImage"] as! PFFile
            
            imageFile.getDataInBackgroundWithBlock({ (theData: NSData?, error: NSError?) ->
                Void in
                
                // Failure to get image
                if let error = error {
                    // Log Failure
                    NSLog("Error loading image at cell \(indexPath.section)")
                }
                    // Success getting image
                else {
                    // Get image and set to cell's content
                    let image = UIImage(data: theData!)
                    cell.headerImageView.image = image
                }
            })
            

        }
        */
        
        //Set address label
        if (data?[indexPath.section]["eventAddress"] != nil) {
            let eventAddress = data![indexPath.section]["eventAddress"] as! String
            cell.addressLabel.text = eventAddress
        }
        
        //Set date label
        if (data?[indexPath.section]["date"] != nil) {
            let date = data![indexPath.section]["date"] as! String
            cell.dateLabel.text = date
        }
        
        //Set status label
        if (data?[indexPath.section]["status"] == nil) {
            cell.statusOfBookingLabel.text = "Pending..."
        } else {
            let status = data![indexPath.section]["status"] as! Bool
            if(status == true) {
                cell.statusOfBookingLabel.text = "Accepted!"
            } else {
            cell.statusOfBookingLabel.text = "Declined"
            }
        }
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
