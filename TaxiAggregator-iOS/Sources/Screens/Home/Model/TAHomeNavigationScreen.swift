//
//  TAMapTransition.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAHomeNavigationScreen {
    case setDestination(from: TAAddressModel)
    case showTaxisOptions(from: TAAddressModel, to: TAAddressModel)
}

// MARK: - Equatable

extension TAHomeNavigationScreen: Equatable {
    
    static func ==(lhs: TAHomeNavigationScreen, rhs: TAHomeNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.setDestination(l), .setDestination(r)):
            return l == r
        case (.showTaxisOptions, .showTaxisOptions):
            return true
        case (.setDestination, _),
             (.showTaxisOptions, _):
            return false
        }
    }
    
}
