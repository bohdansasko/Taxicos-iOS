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
        let viewModel = makeMapViewModel(responder: responder)
        let vc = TAMapViewController(viewModel: viewModel)
        return vc
    }
    
    private func makeMapViewModel(responder: TARecognizeUserLocationResponder) -> TAMapViewModel {
        return TAMapViewModel(recognizeUserLocationResponder: responder)
    }
    
}
