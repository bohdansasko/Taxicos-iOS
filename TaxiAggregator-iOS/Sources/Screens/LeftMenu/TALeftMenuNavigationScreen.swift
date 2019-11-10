//
//  TALeftMenuNavigationScreen.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 05.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TALeftMenuNavigationScreen {
    case savedAddresses
    case shareApp
    case feedback
    case rateApp
}

// MARK: - Navigation

extension TALeftMenuNavigationScreen {
    
    var hidesNavigationBar: Bool {
        switch self {
        case .shareApp, .feedback, .rateApp:
            return true
        case .savedAddresses:
            return false
        }
    }
    
}

// MARK: - Equatable

extension TALeftMenuNavigationScreen: Equatable {
    
    static func ==(lhs: TALeftMenuNavigationScreen, rhs: TALeftMenuNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case (.savedAddresses, .savedAddresses):
            return true
        case (.shareApp, .shareApp):
            return true
        case (.feedback, .feedback):
            return true
        case (.rateApp, .rateApp):
            return true
        case (.savedAddresses, _),
             (.shareApp, _),
             (.feedback, _),
             (.rateApp, _):
            return false
        }
    }
    
}
