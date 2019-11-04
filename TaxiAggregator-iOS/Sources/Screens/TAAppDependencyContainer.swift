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
    
    func makeLeftSideMenuNavigationController() -> SideMenuNavigationController {
        let mainMenuViewController = makeMainMenuViewController()
        
        let leftMenu = SideMenuNavigationController(rootViewController: mainMenuViewController)
        leftMenu.leftSide = true
        leftMenu.statusBarEndAlpha = 0
        leftMenu.setNavigationBarHidden(true, animated: false)
        leftMenu.presentationStyle.onTopShadowOpacity = 0.8
        SideMenuManager.default.leftMenuNavigationController = leftMenu
        
        return leftMenu
    }
    
    func makeMainMenuViewController() -> TAMainMenuViewController {
        let mainMenuViewModel = makeMainMenuViewModel()
        let vc = TAMainMenuViewController(viewModel: mainMenuViewModel)
        return vc
    }
    
    func makeMainMenuViewModel() -> TAMainMenuViewModel {
        return TAMainMenuViewModel()
    }
    
    func makeMainContentViewController() -> UINavigationController {
        let launchViewController = makeLaunchViewController()
        let leftSideMenuFactory = {
            return self.makeLeftSideMenuNavigationController()
        }
        let onboardingFactory = {
            return self.makeOnboardingViewController()
        }
        
        let vc = TAMainContentViewController(
            viewModel: sharedMainViewModel,
            leftSideMenuFactory: leftSideMenuFactory,
            launchViewController: launchViewController,
            onboardingFactory: onboardingFactory
        )
        return UINavigationController(rootViewController: vc)
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
