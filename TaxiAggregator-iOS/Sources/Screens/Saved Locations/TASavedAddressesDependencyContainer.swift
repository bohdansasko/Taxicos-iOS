//
//  TASavedAddressesDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TASavedAddressesDependencyContainer {
    
    func makeSavedAddressesViewController() -> TASavedAddressesViewController {
        let viewModel = makeSavedAddressesViewModel()
        let vc = TASavedAddressesViewController(viewModel: viewModel)
        return vc
    }

    private func makeSavedAddressesViewModel() -> TASavedAddressesViewModel {
        return TASavedAddressesViewModel()
    }
    
}
