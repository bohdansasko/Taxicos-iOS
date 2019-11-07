//
//  TAMainDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAMainFactory {
    func makeHomeViewController() -> TAHomeViewController
    func makeLaunchViewController() -> TALaunchViewController
}

final class TAMainDependencyContainer {
    
}

extension TAMainDependencyContainer {
    
    func makeMainViewController() -> TAMainViewController {
        let viewModel = TAMainViewModel()
        let vc = TAMainViewController(viewModel: viewModel, mainFactory: self)
        return vc
    }
    
}

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
    
}
