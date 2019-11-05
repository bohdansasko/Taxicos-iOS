//
//  TAThemeable.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAThemeable: class {
    func apply(theme: TATheme)
}

// MARK: - UITraitEnvironment

extension TAThemeable where Self: UITraitEnvironment {
    
    var themeProvider: TAThemeProvider {
        return TALegacyThemeProvider.shared
    }
    
}
