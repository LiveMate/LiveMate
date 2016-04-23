//
//  QueryResultsViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/12/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse
class QueryResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var data: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        callParseBackend()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callParseBackend() {
        let query = PFQuery(className: "ArtistData")
        
        query.orderByAscending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistTableViewCell", forIndexPath: indexPath) as! ArtistTableViewCell
        
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
        if (data?[indexPath.section]["location"] != nil) {
            let location = data![indexPath.section]["location"] as! String
            cell.locationLabel.text = location
        }
        
        if (data?[indexPath.section]["artistName"] != nil) {
            cell.artistNameLabel.text = data![indexPath.section]["artistName"] as! String
        }
        
        if (data?[indexPath.section]["price"] != nil) {
            cell.priceLabel.text = "$" + (data![indexPath.section]["price"] as! String)
        }
        
        if (data?[indexPath.section]["genre"] != nil) {
            cell.genreLabel.text = (data![indexPath.section]["genre"] as! String)
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        //let backgroundView = UIView()
        //backgroundView.backgroundColor = UIColor.grayColor()
        
        //cell.selectedBackgroundView = backgroundView
        let indexPath = tableView.indexPathForCell(cell)
        let artist = data![indexPath!.section]
        let bookArtistViewController = segue.destinationViewController as! BookArtistViewController
        bookArtistViewController.artist = artist
        //cell.selectionStyle = .None
        
    }
    

}
