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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        artistNameLabel.text = artist["artistName"] as? String
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
