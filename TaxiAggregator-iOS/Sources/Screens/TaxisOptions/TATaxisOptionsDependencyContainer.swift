//
//  TATaxisOptionsDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TATaxisOptionsDependencyContainer {
    
}

extension TATaxisOptionsDependencyContainer {
    
    func makeTaxisOptionsViewController(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewController {
        let viewModel = makeTaxisOptionsViewModel(from: fromAddress, to: toAddress)
        let vc = TATaxisOptionsViewController(viewModel: viewModel)
        return vc
    }
    
    private func makeTaxisOptionsViewModel(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> TATaxisOptionsViewModel {
        let remoteAPI = TAVinsoTaxisOptionsRemoteAPI()
        let repository = TAFakeTaxisOptionsRepository(remoteAPI: remoteAPI)
        return TATaxisOptionsViewModel(repository: repository, from: fromAddress, to: toAddress)
    }
    
}
