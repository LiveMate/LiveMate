//
//  UserData.swift
//  LiveMate
//
//  Created by zeus medina on 3/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

//This class manges the Artist User type
class ArtistData: NSObject {
    
    func userCreatedArtistProfile(location: String, price: String, name: String, genre: String, youtubeUrl: String) {
        let artist = PFObject(className: "ArtistData")
        let user = PFUser.currentUser()
        artist["author"] = user
        artist["location"] = location
        artist["price"] = price
        
        artist.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }

    }
}
