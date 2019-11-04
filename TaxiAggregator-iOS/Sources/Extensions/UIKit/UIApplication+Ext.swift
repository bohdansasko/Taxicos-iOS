//
//  UIApplication+Extension.swift
//  exmo-ios-client
//
//  Created by Bogdan Sasko on 23.10.2019.
//  Copyright © 2019 Bogdan Sasko. All rights reserved.
//

import UIKit

extension UIApplication {

    class func topmostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topmostViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topmostViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topmostViewController(controller: presented)
        }
        
        return nil
    }
    
}

