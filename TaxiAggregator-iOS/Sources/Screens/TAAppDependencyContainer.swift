//
//  TAAppDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SideMenu

final class TAAppDependencyContainer {
    let sharedUserSessionRepository: TAUserSessionRepository
    let sharedMainViewModel        : TAMapViewModel
    
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
        sharedMainViewModel         = TAMapViewModel()
    }
    
}

extension TAAppDependencyContainer {
    
    func makeLeftMenuNavigationController() -> SideMenuNavigationController {
        let leftMenuViewController = makeLeftMenuViewController()
        
        let leftMenuNavigation = SideMenuNavigationController(rootViewController: leftMenuViewController)
        leftMenuNavigation.leftSide = true
        leftMenuNavigation.statusBarEndAlpha = 0
        leftMenuNavigation.setNavigationBarHidden(true, animated: false)
        leftMenuNavigation.presentationStyle.onTopShadowOpacity = 0.8
        
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigation
        
        return leftMenuNavigation
    }
    
    func makeLeftMenuViewController() -> TALeftMenuViewController {
        let leftMenuViewModel = makeLeftMenuViewModel()
        let vc = TALeftMenuViewController(viewModel: leftMenuViewModel)
        return vc
    }
    
    func makeLeftMenuViewModel() -> TALeftMenuViewModel {
        return TALeftMenuViewModel()
    }
    
    func makeMapViewController() -> TAMapViewController {
        let launchViewController = makeLaunchViewController()
        let leftSideMenuFactory = {
            return self.makeLeftMenuNavigationController()
        }
        let onboardingFactory = {
            return self.makeOnboardingViewController()
        }
        
        let vc = TAMapViewController(
            viewModel: sharedMainViewModel,
            leftSideMenuFactory: leftSideMenuFactory,
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
