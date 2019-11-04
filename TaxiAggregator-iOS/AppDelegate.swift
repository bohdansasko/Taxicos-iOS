//
//  AppDelegate.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 01.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDependencyContainer = TAAppDependencyContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyACPHIWoEdxs5RWDIYMOUP1I-r6AFiA7Zo")
        
        let mainVC = appDependencyContainer.makeMainContentViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        return true
    }

}
