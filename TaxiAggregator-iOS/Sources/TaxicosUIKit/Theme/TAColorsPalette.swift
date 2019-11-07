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
    
    var menuItemFont: UIFont
    var menuItemTextColor: UIColor
    var menuItemBackgroundColor: UIColor

    var versionLabelFont: UIFont
    var versionLabelColor: UIColor
    
    var onboardingSkipButtonFont: UIFont
    var onboardingSkipButtonColor: UIColor
    
    var onboardingNextButtonFont: UIFont
    var onboardingNextButtonColor: UIColor
}

// MARK: - Palette Templates

extension TAColorsPalette {

    static let light: TAColorsPalette = .init(
        backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        titleColor: #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1),
        
        textFieldBackgroundColor: #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1),
        textFieldTextColor: #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1),
        
        menuItemFont: UIFont.helvetica(weight: .regular, fontSize: 18),
        menuItemTextColor: #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1),
        menuItemBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0),
        
        versionLabelFont: UIFont.helvetica(weight: .regular, fontSize: 14),
        versionLabelColor: #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1),
        
        onboardingSkipButtonFont: UIFont.avenir(weight: .medium, fontSize: 14),
        onboardingSkipButtonColor: #colorLiteral(red: 0.6862745098, green: 0.6980392157, blue: 0.7176470588, alpha: 1),
        onboardingNextButtonFont: UIFont.avenir(weight: .medium, fontSize: 14),
        onboardingNextButtonColor: #colorLiteral(red: 0.2549019608, green: 0.3137254902, blue: 0.6196078431, alpha: 1)
    )
    
}
