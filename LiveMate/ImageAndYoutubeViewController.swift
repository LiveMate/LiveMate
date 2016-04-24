//
//  ImageAndYoutubeViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/23/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class ImageAndYoutubeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Artist Key Fields from previous view controller
    var location: String!
    var bio: String!
    var price: String!
    var name: String!!
    var genre: String!
    
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var uploadPhotoButton: UIButton!
    
    @IBOutlet weak var youtubeLinkTextField: UITextField!
    
    @IBOutlet weak var saveArtistProfileButton: UIButton!
    
    
    let artist = ArtistData()
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        headerImageView.hidden = true
        saveArtistProfileButton.hidden = true
        
        //Ensures photo library is accessible, will remove upload functionality otherwise
        if(UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) == false) {
            uploadPhotoButton.enabled = false
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showImagePickerController() {
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func onUploadPhotoButton(sender: AnyObject) {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        showImagePickerController()
    }
    
   
    @IBAction func onSaveArtistProfileButton(sender: AnyObject) {
        
        print(self.location)
        print(self.price)
        print(self.name)
        print(self.genre)
        print(self.youtubeLinkTextField.text)
        print(self.bio)
        artist.userCreatedArtistProfile(self.location, price: self.price, name: self.name, genre: self.genre, youtubeUrl: self.youtubeLinkTextField.text!, bio: bio, headerImage: headerImageView.image!)

    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            // Make buttons active
            headerImageView.hidden = false
            saveArtistProfileButton.hidden = false
            
            
            let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Set preview of image
            headerImageView.image = chosenImage
            
            dismissViewControllerAnimated(true, completion: nil)
            
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
