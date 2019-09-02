//
//  AppDelegate.swift
//  ViperDeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/* AppDelegate
 This is application class
 */
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Colors.changeDefaults()
        window = UIWindow(frame: UIScreen.main.bounds)
        let friendBrowseNavC = UINavigationController(rootViewController: DeliveryBrowseVC())
        friendBrowseNavC.navigationBar.barTintColor = Colors.white
        friendBrowseNavC.navigationBar.tintColor = Colors.reddish
        friendBrowseNavC.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        window?.rootViewController = friendBrowseNavC
        window?.makeKeyAndVisible()
        return true
    }
}
