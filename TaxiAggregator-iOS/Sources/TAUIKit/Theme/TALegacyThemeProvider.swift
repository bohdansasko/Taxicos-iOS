//
//  TALegacyThemeProvider.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TALegacyThemeProvider {
    static let shared = TALegacyThemeProvider()
    
    private var observers = NSHashTable<AnyObject>.weakObjects()
    let theme: TATheme = .light
}

// MARK: - TAThemeProvider

extension TALegacyThemeProvider: TAThemeProvider {
    
    func register<Observer: TAThemeable>(observer: Observer) {
        observers.add(observer)
        observer.apply(theme: theme)
    }
    
    func unregister<Observer: TAThemeable>(observer: Observer) {
        observers.remove(observer)
    }
    
}
