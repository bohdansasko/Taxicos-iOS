//
//  TAAppDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAAppDependencyContainer {
    let sharedUserSessionRepository: TAUserSessionRepository
    let sharedMainViewModel        : TAMainContentViewModel
    
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
        
        sharedUserSessionRepository = makeUserSessionRepository()
        sharedMainViewModel         = TAMainContentViewModel()
    }
    
}

extension TAAppDependencyContainer {
    
    func makeMainContentViewController() -> TAMainContentViewController {
        let launchViewController = makeLaunchViewController()
        let onboardingFactory = {
            return self.makeOnboardingViewController()
        }
        
        let vc = TAMainContentViewController(
            viewModel: sharedMainViewModel,
            launchViewController: launchViewController,
            onboardingFactory: onboardingFactory
        )
        return vc
    }
    
    func makeLaunchViewController() -> TALaunchViewController {
        let launchViewModel = makeLaunchViewModel()
        let vc = TALaunchViewController(viewModel: launchViewModel)
        return vc
    }
    
    func makeLaunchViewModel() -> TALaunchViewModel {
        return TALaunchViewModel()
    }
    
    func makeOnboardingViewController() -> TAOnboardingViewController {
        let onboardingViewModel = makeOnboardingViewModel()
        return TAOnboardingViewController(viewModel: onboardingViewModel)
    }
    
    func makeOnboardingViewModel() -> TAOnboardingViewModel {
        return TAOnboardingViewModel()
    }
    
}
