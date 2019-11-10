//
//  TATheme.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

struct TATheme {
    static let light = TATheme(colors: .light, type: .light)
    
    enum `Type` {
        case light
    }
    
    var colors: TAColorsPalette
    var type: Type = .light
}
