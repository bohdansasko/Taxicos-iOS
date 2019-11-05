//
//  TAThemeProvider.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TAThemeProvider {
    var theme: TATheme { get }
    
    func register<Observer: TAThemeable>(observer: Observer)
    func unregister<Observer: TAThemeable>(observer: Observer)
}
