//
//  TADestinationDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TADestinationFactory {
    func makeChooseOnMapViewController(with startAddress: TAAddressModel) -> TAChooseOnMapViewController
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController
}

final class TADestinationDependencyContainer {
    
}

extension TADestinationDependencyContainer {
    
    func makeDestinationViewController(from fromAddress: TAAddressModel) -> TADestinationViewController {
        let remoteAPI = TAGoogleLocationRemoteAPI()
        let locationRepository = TAVinsoLocationRepository(remoteAPI: remoteAPI)
        let viewModel = TADestinationViewModel(locationRepository: locationRepository, from: fromAddress)
        let vc = TADestinationViewController(viewModel: viewModel, factory: self)
        return vc
    }
    
}

// MARK: - TADestinationFactory

extension TADestinationDependencyContainer: TADestinationFactory {
    
    func makeChooseOnMapViewController(with startAddress: TAAddressModel) -> TAChooseOnMapViewController {
        let dp = TAChooseOnMapDependencyContainer(with: startAddress)
        let vc = dp.makeChooseOnMapViewController()
        return vc
    }
    
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController {
        let taxisOptionsDependencyContainer = TATaxisOptionsDependencyContainer()
        let vc = taxisOptionsDependencyContainer.makeTaxisOptionsViewController(from: fromAddress, to: toAddress)
        return vc
    }
    
}
