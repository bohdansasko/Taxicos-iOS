//
//  TAMapTransition.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAHomeNavigationScreen {
    case leftMenu
    case leftMenuScreen(TALeftMenuNavigationScreen)
}

// MARK: - Equatable

extension TAHomeNavigationScreen: Equatable {
    
    static func ==(lhs: TAHomeNavigationScreen, rhs: TAHomeNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case (.leftMenu, .leftMenu):
            return true
        case let (.leftMenuScreen(l), .leftMenuScreen(r)):
            return l == r
        case (.leftMenu, _),
             (.leftMenuScreen, _):
            return false
        }
    }
    
}
