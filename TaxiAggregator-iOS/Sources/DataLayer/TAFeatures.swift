//
//  TAFeatures.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 10.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAFeatures {
    private let _datastore: TAFeaturesDatastore
    
    init(datastore: TAFeaturesDatastore) {
        _datastore = datastore
    }
    
}

// MARK: - Onboarding

extension TAFeatures {
    
    var isUserSeenOnboarding: Bool {
        return _datastore.isUserSeenOnboarding
    }
    
    func setUserSeenOnboarding(isUserSeen: Bool) {
        _datastore.setUserSeenOnboarding(isUserSeen: isUserSeen)
    }
    
}
