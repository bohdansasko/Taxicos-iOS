//
//  UIControl+Ext.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

extension UIControl {
    
    /// listen .touchUpInside by default
    func addTarget(_ target: Any, action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
