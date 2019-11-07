//
//  TAAppDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAAppDependencyContainer {
    private let sharedUserSessionRepository: TAUserSessionRepository
    private let sharedMainViewModel        : TAMainViewModel
    
    init() {
        func makeUserSessionRepository() -> TAUserSessionRepository {
            let dataStore = makeUserSessionDataStore()
            let authRemoteAPI = makeAuthRemoteAPI()
            let sessionRepository = TAAppUserSessionRepository(
                dataStore: dataStore,
                authRemoteAPI: authRemoteAPI
            )
            return sessionRepository
        }
        
        func makeUserSessionDataStore() -> TAUserSessionDataStore {
            let coder = makeUserSessionCoder()
            return TADatabaseSessionDataStore(with: coder)
        }
        
        func makeUserSessionCoder() -> TAUserSessionCoding {
            return TAUserSessionPropertyListCoder()
        }
        
        func makeAuthRemoteAPI() -> TAAuthRemoteAPI {
            return TAFakeAuthRemoteAPI()
        }
        
        func makeMainViewModel() -> TAMainViewModel {
            return TAMainViewModel()
        }
        
        sharedUserSessionRepository = makeUserSessionRepository()
        sharedMainViewModel         = makeMainViewModel()
    }
    
}

extension TAAppDependencyContainer {
    
    func makeMainViewController() -> UIViewController {
        let mainDP = TAMainDependencyContainer()
        let vc = mainDP.makeMainViewController()
        return vc
    }
    
}
