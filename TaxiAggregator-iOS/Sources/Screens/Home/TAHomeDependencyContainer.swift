//
//  TAHomeDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAHomeFactory {
    func makeMapViewController() -> UIViewController
    func makeLeftMenuNavigationController() -> UINavigationController
}

final class TAHomeDependencyContainer {
    
    func makeHomeViewController() -> TAHomeViewController {
        let viewModel = makeHomeViewModel()
        let vc = TAHomeViewController(
            viewModel: viewModel,
            homeFactory: self
        )
        return vc
    }
    
    private func makeHomeViewModel() -> TAHomeViewModel {
        return TAHomeViewModel()
    }
    
}

extension TAHomeDependencyContainer: TAHomeFactory {
    
    func makeMapViewController() -> UIViewController {
        let mapDependencyContainer = TAMapDependencyContainer()
        let vc = mapDependencyContainer.makeMapViewController()
        return vc
    }
    
    func makeLeftMenuNavigationController() -> UINavigationController {
        let leftMenuDependencyContainer = TALeftMenuDependencyContainer()
        let vc = leftMenuDependencyContainer.makeLeftMenuNavigationController()
        return vc
    }
    
}
