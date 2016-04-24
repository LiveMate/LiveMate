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
    
    func userCreatedArtistProfile(location: String, price: String, name: String, genre: String, youtubeUrl: String!, bio:String, headerImage: UIImage) {
        let artist = PFObject(className: "ArtistData")
        let user = PFUser.currentUser()
        
        
        artist["author"] = user
        artist["location"] = location
        artist["price"] = price
        artist["artistName"] = name
        artist["genre"] = genre
        artist["artistBio"] = bio
        
        //Set the artist's header image
        artist["headerImage"] = getImage(headerImage)
        
        //Set the artist's YoutubeID by extracting it from youtubeUrl
        var url: String!
        url = youtubeUrl
        url.removeRange(url.startIndex..<url.startIndex.advancedBy(32))
        print("This is supposed to be the youtube I")
        print(url)
        artist["youtubeId"] = url
        
       
        
        artist.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print("The user created an Artist profile!")
            } else {
                // There was a problem, check error.description
                print("Error in creating an artist profile")
            }
        }
        
        user!["isArtist"] = true
        //Create a reference from User object to ArtistData object
        user!["artistReference"] = artist
        user?.saveInBackground()

    }
    
    //PFFile represents any sort of file type on Parse, in this case an image.
    func getImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
