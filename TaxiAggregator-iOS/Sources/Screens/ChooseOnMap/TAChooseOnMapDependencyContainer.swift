//
//  TAChooseOnMapDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAChooseOnMapDependencyContainer {
    private let _currentAddress: TAAddressModel
    private let _addressType: TAActiveAddressTyping
    private let _destinationViewModel: TADestinationViewModel
    
    init(with currentAddress: TAAddressModel, addressType: TAActiveAddressTyping, destinationViewModel: TADestinationViewModel) {
        _currentAddress = currentAddress
        _addressType = addressType
        _destinationViewModel = destinationViewModel
    }
    
    func makeChooseOnMapViewController() -> TAChooseOnMapViewController {
        let viewModel = TAChooseOnMapViewModel(addressType: _addressType, confirmAddressResponder: _destinationViewModel)
        let chooseOnMapViewController = makeChooseLocationOnMapViewController(idleLocationResponder: viewModel)
        
        let vc = TAChooseOnMapViewController(viewModel: viewModel,
                                             chooseOnMapViewController: chooseOnMapViewController)
        return vc
    }
    
    private func makeChooseLocationOnMapViewController(idleLocationResponder: TAIdleLocationResponder) -> TAChooseLocationOnMapViewController {
        let dc = TAChooseLocationOnMapDependencyContainer(idleLocationResponder: idleLocationResponder)
        let vc = dc.makeChooseLocationOnMapViewController(with: _currentAddress)
        return vc
    }
    
}
