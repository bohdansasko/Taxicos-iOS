//
//  TAChooseOnMapDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TAChooseOnMapFactory {
    func makeChooseLocationOnMapViewController() -> TAChooseLocationOnMapViewController
}

final class TAChooseOnMapDependencyContainer {
    private let _currentAddress: TAAddressModel
    
    init(with currentAddress: TAAddressModel) {
        _currentAddress = currentAddress
    }
    
    func makeChooseOnMapViewController() -> TAChooseOnMapViewController {
        let viewModel = TAChooseOnMapViewModel()
        let chooseOnMapViewController = makeChooseLocationOnMapViewController()
        
        let vc = TAChooseOnMapViewController(viewModel: viewModel,
                                             chooseOnMapViewController: chooseOnMapViewController)
        return vc
    }
    
}

extension TAChooseOnMapDependencyContainer: TAChooseOnMapFactory {
    
    func makeChooseLocationOnMapViewController() -> TAChooseLocationOnMapViewController {
        let dc = TAChooseLocationOnMapDependencyContainer()
        let vc = dc.makeChooseLocationOnMapViewController(with: _currentAddress)
        return vc
    }
    
}
