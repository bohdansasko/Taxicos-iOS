//
//  TAColorsPalette.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

struct TAColorsPalette {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var textFieldBackgroundColor: UIColor
    var textFieldTextColor: UIColor
    var menuTextColor: UIColor
    
    static let light: TAColorsPalette = .init(
        backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        titleColor: #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1),
        textFieldBackgroundColor: #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1),
        textFieldTextColor: #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1),
        menuTextColor: #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
    )
    
}
