//
//  TAConfig.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAConfig {
    static var appVersion: String { return "1.0.0" }
    static var appLinkInTheAppStore: String { return "" }
}

// MARK: - Map

extension TAConfig {
    
    enum Map {
        enum GoogleAPIKeys {
            static var map   : String { return "AIzaSyCPhPMxrgdByKQCrt8thI4XZ5pG2DuxmDo" }
            static var places: String { return "AIzaSyCcjM-YfwsUmonRehkmIMg6a4Smy3UgLuM" }
            static var geocoding: String { return "AIzaSyCcjM-YfwsUmonRehkmIMg6a4Smy3UgLuM" }
        }
        
        static var kHomeMapZoom: Float  { return 15 }
        static var kMyLocationMapZoom: Float  { return 19 }
    }
    
}

// MARK: - UserDefaults

extension TAConfig {
    
    enum UserDefaultsKeys: String {
        case isUserSeenOnboarding
    }
    
}
