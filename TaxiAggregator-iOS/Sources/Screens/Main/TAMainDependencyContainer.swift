//
//  TAMainDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAMainFactory {
    func makeHomeViewController()       -> TAHomeViewController
    func makeLaunchViewController()     -> TALaunchViewController
    func makeOnboardingViewController() -> TAOnboardingViewController
}

final class TAMainDependencyContainer {
    let mainViewModel: TAMainViewModel
    
    init(mainViewModel: TAMainViewModel) {
        self.mainViewModel = mainViewModel
    }
}

extension TAMainDependencyContainer {
    
    func makeMainViewController() -> TAMainViewController {
        let vc = TAMainViewController(viewModel: mainViewModel, mainFactory: self)
        return vc
    }
    
}

// MARK: - TAMainFactory

extension TAMainDependencyContainer: TAMainFactory {

    func makeHomeViewController() -> TAHomeViewController {
        let container = TAHomeDependencyContainer()
        let vc = container.makeHomeViewController()
        return vc
    }

    func makeLaunchViewController() -> TALaunchViewController {
        let launchDependencyContainer = TALaunchDependencyContainer()
        let vc = launchDependencyContainer.makeLaunchViewController()
        return vc
    }

    func makeOnboardingViewController() -> TAOnboardingViewController {
        let mainDP = TAOnboardingDependencyContainer(mainViewModel: mainViewModel)
        let vc = mainDP.makeOnboardingViewController()
        return vc
    }
    
}
