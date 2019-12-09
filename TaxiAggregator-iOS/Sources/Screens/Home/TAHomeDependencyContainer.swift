//
//  TAHomeDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAHomeFactory {
    func makeMapViewController() -> TAMapViewController
    func makeSearchDestinationView() -> TASearchDestinationView
    
    func makeDestinationViewController(from fromAddress: TAAddressModel) -> UIViewController
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController
}

final class TAHomeDependencyContainer {
    
    // MARK: - Properties
    
    private let _viewModel: TAHomeViewModel
    
    // MARK: - Methods
    
    init (mainViewModel: TAMainViewModel) {
        func makeHomeViewModel(geocodeAPI: TAGeocodeRemoteAPI) -> TAHomeViewModel {
            return TAHomeViewModel(geocodeRemoteAPI: geocodeAPI, menuResponder: mainViewModel)
        }
        let geocodeAPI = TAGoogleGeocodeRemoteAPI()
        _viewModel = makeHomeViewModel(geocodeAPI: geocodeAPI)
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
    
    func makeMapViewController() -> TAMapViewController {
        let mapDependencyContainer = TAMapDependencyContainer()
        let vc = mapDependencyContainer.makeMapViewController(responder: _viewModel)
        return vc
    }
    
    func makeSearchDestinationView() -> TASearchDestinationView {
        let dataStore = TAFakeSearchHistoryDataStore()
        let viewModel = TASearchDestinationViewModel(dataStore: dataStore, searchDestinationResponder: _viewModel)
        let view = TASearchDestinationView(viewModel: viewModel)
        return view
    }
    
    func makeDestinationViewController(from fromAddress: TAAddressModel) -> UIViewController {
        let destinationDependencyContainer = TADestinationDependencyContainer()
        let vc = destinationDependencyContainer.makeDestinationViewController(from: fromAddress)
        return vc
    }
    
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController {
        let taxisOptionsDependencyContainer = TATaxisOptionsDependencyContainer()
        let vc = taxisOptionsDependencyContainer.makeTaxisOptionsViewController(from: fromAddress, to: toAddress)
        return vc
    }
    
}
