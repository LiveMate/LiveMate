//
//  ArtistProfileViewController.swift
//  LiveMate
//
//  Created by zeus medina on 3/25/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class ArtistProfileViewController: UIViewController {

    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        //Set the artist key fields to be used by ImageAndYoutubeViewController
        let location = self.locationTextField.text
        let price = self.priceTextField.text
        let genre = self.genreTextField.text
        let bio = self.bioTextField.text
        let name = self.nameTextField.text
        
        let imageAndYoutubeView = segue.destinationViewController as! ImageAndYoutubeViewController
        imageAndYoutubeView.location = location
        imageAndYoutubeView.price = price
        imageAndYoutubeView.genre = genre
        imageAndYoutubeView.bio = bio
        imageAndYoutubeView.name = name
        
        
        
    }
    

}
