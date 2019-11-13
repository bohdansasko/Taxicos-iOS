//
//  AppDelegate.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 01.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
import Crashlytics

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDependencyContainer = TAAppDependencyContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GMSServices.provideAPIKey(TAConfig.kGSMAPIKey)

        let mainVC = appDependencyContainer.makeMainViewController()
        setupWindow(with: mainVC)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            Crashlytics.sharedInstance().crash()
        }
        
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
