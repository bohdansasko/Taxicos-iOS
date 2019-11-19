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
    
    func makeDestinationViewController() -> TADestinationViewController {
        let viewModel = TADestinationViewModel()
        let vc = TADestinationViewController(viewModel: viewModel)
        return vc
    }
    
}
