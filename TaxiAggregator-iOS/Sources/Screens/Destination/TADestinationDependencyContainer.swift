//
//  TADestinationDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TADestinationFactory {
    func makeChooseOnMapViewController(with startAddress: TAAddressModel, addressType: TAActiveAddressTyping) -> TAChooseOnMapViewController
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController
}

final class TADestinationDependencyContainer {
    private var _viewModel: TADestinationViewModel?
}

extension TADestinationDependencyContainer {
    
    func makeDestinationViewController(from fromAddress: TAAddressModel) -> TADestinationViewController {
        let remoteAPI = TAGoogleLocationRemoteAPI()
        let locationRepository = TAVinsoLocationRepository(remoteAPI: remoteAPI)
        _viewModel = TADestinationViewModel(locationRepository: locationRepository, from: fromAddress)
        let vc = TADestinationViewController(viewModel: _viewModel!, factory: self)
        return vc
    }
    
}

// MARK: - TADestinationFactory

extension TADestinationDependencyContainer: TADestinationFactory {
    
    func makeChooseOnMapViewController(with startAddress: TAAddressModel, addressType: TAActiveAddressTyping) -> TAChooseOnMapViewController {
        guard let viewModel = _viewModel else {
            fatalError("fix me")
        }
        let dp = TAChooseOnMapDependencyContainer(with: startAddress,
                                                  addressType: addressType,
                                                  destinationViewModel: viewModel)
        let vc = dp.makeChooseOnMapViewController()
        return vc
    }
    
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController {
        let taxisOptionsDependencyContainer = TATaxisOptionsDependencyContainer()
        let vc = taxisOptionsDependencyContainer.makeTaxisOptionsViewController(from: fromAddress, to: toAddress)
        return vc
    }
    
}
