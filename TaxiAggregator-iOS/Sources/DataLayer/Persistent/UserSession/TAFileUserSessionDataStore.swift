//
//  TADatabaseSessionDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFileUserSessionDataStore {
    
}

// MARK: - Session

extension TAFileUserSessionDataStore: TAUserSessionDataStore {
    
    func readUserSession() -> Promise<TAUserSession?> {
        fatalError("hasn't been implemented")
    }
    
    func save(userSession: TAUserSession) -> Promise<TAUserSession> {
        fatalError("hasn't been implemented")
    }
    
    func delete(userSession: TAUserSession) -> Promise<TAUserSession> {
        fatalError("hasn't been implemented")
    }
    
}

// MARK: - Features

extension TAFileUserSessionDataStore: TAFeaturesDatastore {
    
    var isUserSeenOnboarding: Bool {
        return UserDefaults.standard.bool(forKey: TAConfig.UserDefaultsKeys.isUserSeenOnboarding.rawValue)
    }
    
    
    func setUserSeenOnboarding(isUserSeen: Bool) {
        UserDefaults.standard.set(isUserSeen, forKey: TAConfig.UserDefaultsKeys.isUserSeenOnboarding.rawValue)
    }
    
}
