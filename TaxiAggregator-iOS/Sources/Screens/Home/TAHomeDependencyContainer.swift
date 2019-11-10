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
    private let _viewModel: TAHomeViewModel
    
    init () {
        func makeHomeViewModel() -> TAHomeViewModel {
            return TAHomeViewModel()
        }
        _viewModel = makeHomeViewModel()
    }
    
    func makeHomeViewController() -> TAHomeViewController {
        let vc = TAHomeViewController(
            viewModel: _viewModel,
            homeFactory: self
        )
        return vc
    }
    
}

// MARK: - TAHomeFactory

extension TAHomeDependencyContainer: TAHomeFactory {
    
    func makeMapViewController() -> UIViewController {
        let mapDependencyContainer = TAMapDependencyContainer()
        let vc = mapDependencyContainer.makeMapViewController()
        return vc
    }
    
    func makeLeftMenuNavigationController() -> UINavigationController {
        let leftMenuDependencyContainer = TALeftMenuDependencyContainer(menuResponder: _viewModel)
        let vc = leftMenuDependencyContainer.makeLeftMenuNavigationController()
        return vc
    }
    
}
