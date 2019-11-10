//
//  TAFeaturesDatastore.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 10.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TAFeaturesDatastore {
    var isUserSeenOnboarding: Bool { get }
    func setUserSeenOnboarding(isUserSeen: Bool)
}
