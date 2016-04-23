//
//  AppDelegate.swift
//  LiveMate
//
//  Created by zeus medina on 3/12/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)

    //Comment for git testing
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize Parse
        // Set applicationId and server based on the values in the Heroku settings.
        // clientKey is not used on Parse open source unless explicitly configured
        
        var keys: NSDictionary?
        var applicationId: String?
        var clientKey: String?
        
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        print(keys)
        if let dict = keys {
            applicationId = keys?["parseApplicationId"] as? String
            clientKey = keys?["parseClientKey"] as? String
            
        }
        
        
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = applicationId
                configuration.server = "https://live-mate.herokuapp.com/parse"
                configuration.clientKey = clientKey
            })
        )
        
        // Creates the logout action observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: logoutNotification, object: nil)
        
        //Creates the booking submission action observer
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "userSubmittedBookingRequest", name: userSubmittedBookingRequestNotification, object: nil)
        // Checks if there's user already logged, and skips the login screen if so.
        
        if (PFUser.currentUser() != nil) {
            let viewController = storyboard.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
            
            window?.rootViewController = viewController
            
        }
        
        return true
    }
    
    func userDidLogout() {
        let vc = storyboard.instantiateInitialViewController()! as UIViewController
        window?.rootViewController = vc
    }
    /*
    func userSubmittedBookingRequest() {
        let vc = storyboard.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
        window?.rootViewController = vc
    }
    */
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

