//
//  TAChooseLocationOnMapDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAChooseLocationOnMapDependencyContainer {
    
}

extension TAChooseLocationOnMapDependencyContainer {
    
    func makeChooseLocationOnMapViewController(with currentAddress: TAAddressModel?) -> TAChooseLocationOnMapViewController {
        let remoteAPI = TAGoogleLocationRemoteAPI()
        let locationRepository = TAVinsoLocationRepository(remoteAPI: remoteAPI)
        let viewModel = TAChooseLocationOnMapViewModel(locationRepository: locationRepository)
        let vc = TAChooseLocationOnMapViewController(viewModel: viewModel)
        return vc
    }
    
}
