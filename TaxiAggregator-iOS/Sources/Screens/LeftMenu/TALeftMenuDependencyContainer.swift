//
//  TALeftMenuDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import SideMenu

protocol TALeftMenuFactory {
    func makeSavedAddressesViewController() -> TASavedAddressesViewController
}

final class TALeftMenuDependencyContainer {
    
}

extension TALeftMenuDependencyContainer {

    func makeLeftMenuNavigationController() -> UINavigationController {
        let leftMenuViewController = makeLeftMenuViewController()
        
        let leftMenuNavigation = SideMenuNavigationController(rootViewController: leftMenuViewController)
        leftMenuNavigation.leftSide = true
        leftMenuNavigation.statusBarEndAlpha = 0
        leftMenuNavigation.presentationStyle = .menuSlideIn
        leftMenuNavigation.setNavigationBarHidden(true, animated: false)
        leftMenuNavigation.presentationStyle.onTopShadowOpacity = 0.8
        leftMenuNavigation.presentationStyle.presentingEndAlpha = 0.6
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigation
        
        return leftMenuNavigation
    }
    
    private func makeLeftMenuViewController() -> TALeftMenuViewController {
        let leftMenuViewModel = makeLeftMenuViewModel()
        let vc = TALeftMenuViewController(viewModel: leftMenuViewModel, leftMenuFactory: self)
        return vc
    }
    
    private func makeLeftMenuViewModel() -> TALeftMenuViewModel {
        return TALeftMenuViewModel()
    }
    
}

// MARK: - TALeftMenuFactory

extension TALeftMenuDependencyContainer: TALeftMenuFactory {
    
    func makeSavedAddressesViewController() -> TASavedAddressesViewController {
        let dataStore = TAFakeSavedAddressesDataStore()
        let dependencyContainer = TASavedAddressesDependencyContainer(dataStore: dataStore)
        let vc = dependencyContainer.makeSavedAddressesViewController()
        return vc
    }

}

