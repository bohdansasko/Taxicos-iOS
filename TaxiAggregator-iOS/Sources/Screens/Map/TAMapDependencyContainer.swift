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
    
    func makeMapViewController() -> TAMapViewController {
        let viewModel            = makeMapViewModel()
        let vc = TAMapViewController(viewModel: viewModel)
        return vc
    }
    
    private func makeMapViewModel() -> TAMapViewModel {
        return TAMapViewModel()
    }
    
}
