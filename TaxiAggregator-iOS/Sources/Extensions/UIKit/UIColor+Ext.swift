//
//  UIColor+Ext.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

// MARK: - Custom initializers

extension UIColor {
    
    convenience init(rgb: CGFloat, a: CGFloat = 1.0) {
        self.init(red: rgb / 255.0, green: rgb / 255.0, blue: rgb / 255.0, alpha: a)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let r = (hex >> 16) & UInt32(0xff)
        let g = (hex >> 8)  & UInt32(0xff)
        let b = hex         & UInt32(0xff)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), a: alpha)
    }
    
}

extension UIColor {
    
    /// return random color
    static var rnd: UIColor {
        return UIColor(hex: arc4random())
    }
    
    static func hex(_ hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }
    
}
