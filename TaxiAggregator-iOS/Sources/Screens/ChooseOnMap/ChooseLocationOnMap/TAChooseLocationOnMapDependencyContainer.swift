//
//  TAChooseLocationOnMapDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAChooseLocationOnMapDependencyContainer {
    private let _idleLocationResponder: TAIdleLocationResponder
    
    init(idleLocationResponder: TAIdleLocationResponder) {
        _idleLocationResponder = idleLocationResponder
    }
    
}

extension TAChooseLocationOnMapDependencyContainer {
    
    func makeChooseLocationOnMapViewController(with currentAddress: TAAddressModel?) -> TAChooseLocationOnMapViewController {
        let myLocationRemoteAPI = TAGoogleMyLocationRemoteAPI()
        let geocodeRemoteAPI = TAGoogleGeocodeRemoteAPI()
        
        let viewModel = TAChooseLocationOnMapViewModel(
            myLocationRemoteAPI: myLocationRemoteAPI,
            geocodeRemoteAPI: geocodeRemoteAPI,
            idleLocationResponder: _idleLocationResponder,
            currentAddress: currentAddress
        )
        let vc = TAChooseLocationOnMapViewController(viewModel: viewModel)
        return vc
    }
    
}
