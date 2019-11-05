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
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDependencyContainer = TAAppDependencyContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(TAConfig.kGSMAPIKey)

        let mainVC = appDependencyContainer.makeMapViewController()
        setupWindow(with: mainVC)
        
        return true
    }

}

// MARK: - Setup

private extension AppDelegate {
    
    func setupWindow(with rootViewController: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
}
