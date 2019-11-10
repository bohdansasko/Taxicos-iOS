//
//  TASharedUserSessionRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAAppUserSessionRepository {
    private let dataStore: TAUserSessionDataStore
    private let authRemoteAPI: TAAuthRemoteAPI
    
    init(dataStore: TAUserSessionDataStore, authRemoteAPI: TAAuthRemoteAPI) {
        self.dataStore = dataStore
        self.authRemoteAPI = authRemoteAPI
    }
    
}

// MARK: - TAUserSessionRepository

extension TAAppUserSessionRepository: TAUserSessionRepository {
    
    func readUserSession() -> Promise<TAUserSession?> {
        return dataStore.readUserSession()
    }
    
    func signIn() -> Promise<TAUserSession> {
        return Promise { seal in
            seal.fulfill(dataStore.readUserSession().value!!)
        }
    }
    
    
}
