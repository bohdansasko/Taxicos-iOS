//
//  TAMapTransition.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAHomeNavigationScreen {
    case setDestination(TAAddressModel?)
}

// MARK: - Equatable

extension TAHomeNavigationScreen: Equatable {
    
    static func ==(lhs: TAHomeNavigationScreen, rhs: TAHomeNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.setDestination(l), .setDestination(r)):
            return l == r
        }
    }
    
}
