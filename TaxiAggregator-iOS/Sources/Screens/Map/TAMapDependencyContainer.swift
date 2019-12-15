//
//  TAMapDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TAMapDependencyContainer {
    
}

extension TAMapDependencyContainer {
    
    func makeMapViewController(responder: TARecognizeUserLocationResponder) -> TAMapViewController {
        let myLocationRemoteAPI = TAGoogleMyLocationRemoteAPI()
        let viewModel = makeMapViewModel(myLocationRemoteAPI: myLocationRemoteAPI, responder: responder)
        let vc = TAMapViewController(viewModel: viewModel)
        return vc
    }
    
    private func makeMapViewModel(myLocationRemoteAPI: TAMyLocationRemoteAPI, responder: TARecognizeUserLocationResponder) -> TAMapViewModel {
        return TAMapViewModel(myLocationRemoteAPI: myLocationRemoteAPI, recognizeUserLocationResponder: responder)
    }
    
}
