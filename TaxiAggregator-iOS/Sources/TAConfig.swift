//
//  TAConfig.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAConfig {
    static var kGSMAPIKey: String { return "AIzaSyACPHIWoEdxs5RWDIYMOUP1I-r6AFiA7Zo" }
    static var appVersion: String { return "1.0.0" }
}

// MARK: - UserDefaults

extension TAConfig {
    
    enum UserDefaultsKeys: String {
        case isUserSeenOnboarding
    }
    
}
