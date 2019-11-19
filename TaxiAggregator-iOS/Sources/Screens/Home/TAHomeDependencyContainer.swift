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
    func makeSearchDestinationView() -> TASearchDestinationView
}

final class TAHomeDependencyContainer {
    
    // MARK: - Properties
    
    private let _viewModel: TAHomeViewModel
    
    // MARK: - Methods
    
    init (mainViewModel: TAMainViewModel) {
        func makeHomeViewModel() -> TAHomeViewModel {
            return TAHomeViewModel(menuResponder: mainViewModel)
        }
        _viewModel = makeHomeViewModel()
    }
    
}

// MARK: -

extension TAHomeDependencyContainer {
    
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
    
    func makeSearchDestinationView() -> TASearchDestinationView {
        let dataStore = TAFakeSearchHistoryDataStore()
        let viewModel = TASearchDestinationViewModel(dataStore: dataStore, searchDestinationResponder: _viewModel)
        let view = TASearchDestinationView(viewModel: viewModel)
        return view
    }
    
}
