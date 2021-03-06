//
//  ExploreViewController.swift
//  LiveMate
//
//  Created by zeus medina on 4/23/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var locationQueryTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let locationQuery = self.locationQueryTextField.text
        let queryResults = segue.destinationViewController as! QueryResultsViewController
        queryResults.locationQuery = locationQuery
    }
    

}
