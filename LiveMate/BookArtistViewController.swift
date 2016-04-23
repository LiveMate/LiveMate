//
//  BookArtistViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

class BookArtistViewController: UIViewController {

    var artist: PFObject!
    
  
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var headerImage:
    UIImageView!
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        artistNameLabel.text = artist["artistName"] as? String
        genreLabel.text = artist["genre"] as? String
        priceLabel.text = "$" + (artist["price"] as? String)!
        locationLabel.text = artist["location"] as? String
        bioLabel.text = artist["artistBio"] as? String
        
            let imageFile = artist["headerImage"] as! PFFile
            
            imageFile.getDataInBackgroundWithBlock({ (theData: NSData?, error: NSError?) ->
                Void in
                
                // Failure to get image
                if let error = error {
                    // Log Failure
                }
                    // Success getting image
                else {
                    // Get image and set to cell's content
                    let image = UIImage(data: theData!)
                    self.headerImage.image = image
                }
            })
        
        let embedID = artist["youtubeId"]
        let myURL : NSURL = NSURL(string: "https://www.youtube.com/embed/\(embedID)")!
        //Note: use the "embed" address instead of the "watch" address.
        let myURLRequest : NSURLRequest = NSURLRequest(URL: myURL)
        self.webView.loadRequest(myURLRequest)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let artist = self.artist
        let sendBookRequestViewController = segue.destinationViewController as! SendBookRequestViewController
        sendBookRequestViewController.artist = artist

    }
    
    

}
