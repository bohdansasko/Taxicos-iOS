//
//  TAUserSession.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 09.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAUserSession {
    
    // MARK: - Properties

    let profile: TAUserProfile
    let remoteSession: TARemoteUserSession
    let features: TAFeatures
    
    // MARK: - Methods
    
    init(profile: TAUserProfile, remoteSession: TARemoteUserSession, features: TAFeatures) {
        self.profile       = profile
        self.remoteSession = remoteSession
        self.features      = features
    }
    
}

extension TAUserSession: Equatable {
    
    static func ==(lhs: TAUserSession, rhs: TAUserSession) -> Bool {
        return false
    }
    
}
