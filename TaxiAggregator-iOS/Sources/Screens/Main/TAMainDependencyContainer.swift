//
//  TAMainDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAMainFactory {
    func makeHomeViewController()       -> UIViewController
    func makeLaunchViewController()     -> TALaunchViewController
    func makeOnboardingViewController() -> TAOnboardingViewController
}

final class TAMainDependencyContainer {
    private let _mainViewModel: TAMainViewModel
    
    init(mainViewModel: TAMainViewModel) {
        self._mainViewModel = mainViewModel
    }
}

extension TAMainDependencyContainer {
    
    func makeMainViewController() -> UIViewController {
        let vc = TAMainViewController(viewModel: _mainViewModel, mainFactory: self)
        return vc
    }
    
}

// MARK: - TAMainFactory

extension TAMainDependencyContainer: TAMainFactory {

    func makeHomeViewController() -> UIViewController {
        let container = TAHomeDependencyContainer()
        let vc = container.makeHomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }

    func makeLaunchViewController() -> TALaunchViewController {
        let launchDependencyContainer = TALaunchDependencyContainer()
        let vc = launchDependencyContainer.makeLaunchViewController()
        return vc
    }

    func makeOnboardingViewController() -> TAOnboardingViewController {
        let mainDP = TAOnboardingDependencyContainer(mainViewModel: _mainViewModel)
        let vc = mainDP.makeOnboardingViewController()
        return vc
    }
    
}
