//
//  TALeftMenuDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import SideMenu

final class TALeftMenuDependencyContainer {
    private let _menuResponder: TALeftMenuResponsder
    
    init(menuResponder: TALeftMenuResponsder) {
        _menuResponder = menuResponder
    }
    
}

extension TALeftMenuDependencyContainer {

    func makeLeftMenuNavigationController() -> UINavigationController {
        let leftMenuViewController = makeLeftMenuViewController()
        
        let leftMenuNavigation = SideMenuNavigationController(rootViewController: leftMenuViewController)
        leftMenuNavigation.leftSide = true
        leftMenuNavigation.statusBarEndAlpha = 0
        leftMenuNavigation.setNavigationBarHidden(true, animated: false)
        leftMenuNavigation.presentationStyle.onTopShadowOpacity = 0.8

        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigation
        
        return leftMenuNavigation
    }
    
    private func makeLeftMenuViewController() -> TALeftMenuViewController {
        let leftMenuViewModel = makeLeftMenuViewModel()
        let vc = TALeftMenuViewController(viewModel: leftMenuViewModel)
        return vc
    }
    
    private func makeLeftMenuViewModel() -> TALeftMenuViewModel {
        return TALeftMenuViewModel(menuResponder: _menuResponder)
    }
    
}
