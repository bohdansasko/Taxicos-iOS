//
//  TAMainNavigationScreen.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 12.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAMainNavigationScreen {
    case home(userSession: TAUserSession)
    case onboarding
    case leftMenu
}

// MARK: - Equatable

extension TAMainNavigationScreen: Equatable {
    
    static func == (lhs: TAMainNavigationScreen, rhs: TAMainNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case (.onboarding, .onboarding),
             (.leftMenu, .leftMenu):
            return true
        case let (.home(l), .home(r)):
            return l == r
        case (.onboarding, _),
             (.home, _),
             (.leftMenu, _):
            return false
        }
    }
    
}
