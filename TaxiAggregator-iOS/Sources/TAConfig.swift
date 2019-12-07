//
//  TAConfig.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAConfig {
    static var kGSPAPIKey: String { return "AIzaSyCcjM-YfwsUmonRehkmIMg6a4Smy3UgLuM" }
    static var kGSMAPIKey: String { return "AIzaSyCcjM-YfwsUmonRehkmIMg6a4Smy3UgLuM" }
    static var appVersion: String { return "1.0.0" }
    static var kMapZoom  : Float  { return 15 }
    
    static var appLinkInTheAppStore: String { return "" }
}

// MARK: - UserDefaults

extension TAConfig {
    
    enum UserDefaultsKeys: String {
        case isUserSeenOnboarding
    }
    
}
