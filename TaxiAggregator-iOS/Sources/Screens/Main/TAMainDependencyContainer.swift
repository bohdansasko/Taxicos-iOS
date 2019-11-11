//
//  TAMainDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAMainFactory {
    func makeHomeViewController() -> UIViewController
    func makeOnboardingViewController() -> TAOnboardingViewController
    func makeLeftMenuNavigationController() -> UINavigationController
}

final class TAMainDependencyContainer {
    private let _viewModel: TAMainViewModel
    
    init(mainViewModel: TAMainViewModel) {
        self._viewModel = mainViewModel
    }
}

extension TAMainDependencyContainer {
    
    func makeMainViewController() -> UIViewController {
        let vc = TAMainViewController(viewModel: _viewModel, mainFactory: self)
        let nav = TANavigationController(rootViewController: vc)
        return nav
    }
    
}

// MARK: - TAMainFactory

extension TAMainDependencyContainer: TAMainFactory {

    func makeHomeViewController() -> UIViewController {
        let container = TAHomeDependencyContainer(mainViewModel: _viewModel)
        let vc = container.makeHomeViewController()
        let nav = TANavigationController(rootViewController: vc)
        return nav
    }

    func makeOnboardingViewController() -> TAOnboardingViewController {
        let mainDP = TAOnboardingDependencyContainer(mainViewModel: _viewModel)
        let vc = mainDP.makeOnboardingViewController()
        return vc
    }
    
    func makeLeftMenuNavigationController() -> UINavigationController {
        let leftMenuDependencyContainer = TALeftMenuDependencyContainer()
        let vc = leftMenuDependencyContainer.makeLeftMenuNavigationController()
        return vc
    }
    
}
