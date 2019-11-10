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
        return Promise { seal in
            let profile       = TAUserProfile()
            let remoteSession = TARemoteUserSession(token: "fakeToken123")
            let features      = TAFeatures(datastore: self)
            let userSession   = TAUserSession(profile: profile,
                                              remoteSession: remoteSession,
                                              features: features)
            seal.fulfill(userSession)
        }
    }
    
    func save(userSession: TAUserSession) -> Promise<TAUserSession> {
        return Promise { seal in
            seal.fulfill(userSession)
        }
    }
    
    func delete(userSession: TAUserSession) -> Promise<TAUserSession> {
        return Promise { seal in
            seal.fulfill(userSession)
        }
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
