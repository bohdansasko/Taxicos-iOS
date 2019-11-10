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
            return TAFileUserSessionDataStore()
        }
        
        func makeAuthRemoteAPI() -> TAAuthRemoteAPI {
            return TAFakeAuthRemoteAPI()
        }
        
        func makeMainViewModel(userSessionRepository: TAUserSessionRepository) -> TAMainViewModel {
            return TAMainViewModel(userSessionRepository: userSessionRepository)
        }
        
        sharedUserSessionRepository = makeUserSessionRepository()
        sharedMainViewModel         = makeMainViewModel(userSessionRepository: sharedUserSessionRepository)
    }
    
}

extension TAAppDependencyContainer {
    
    func makeMainViewController() -> UIViewController {
        let mainDP = TAMainDependencyContainer(mainViewModel: sharedMainViewModel)
        let vc = mainDP.makeMainViewController()
        return vc
    }
    
}
