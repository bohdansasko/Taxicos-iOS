//
//  TAFakeUserSessionDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFakeUserSessionDataStore {
    
}

// MARK: - Session

extension TAFakeUserSessionDataStore: TAUserSessionDataStore {
    
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

extension TAFakeUserSessionDataStore: TAFeaturesDatastore {
    
    var isUserSeenOnboarding: Bool {
        return UserDefaults.standard.bool(forKey: TAConfig.UserDefaultsKeys.isUserSeenOnboarding.rawValue)
    }
    
    
    func setUserSeenOnboarding(isUserSeen: Bool) {
        UserDefaults.standard.set(isUserSeen, forKey: TAConfig.UserDefaultsKeys.isUserSeenOnboarding.rawValue)
    }
    
}
