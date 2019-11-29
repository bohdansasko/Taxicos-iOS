//
//  TADestinationDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TADestinationDependencyContainer {
    
}

extension TADestinationDependencyContainer {
    
    func makeDestinationViewController(from fromAddress: TAAddressModel?) -> TADestinationViewController {
        let remoteAPI = TAVinsoLocationRemoteAPI()
        let locationRepository = TAVinsoLocationRepository(remoteAPI: remoteAPI)
        let viewModel = TADestinationViewModel(locationRepository: locationRepository, from: fromAddress)
        let vc = TADestinationViewController(viewModel: viewModel)
        return vc
    }
    
}
