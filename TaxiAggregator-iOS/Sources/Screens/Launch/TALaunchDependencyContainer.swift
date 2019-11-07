//
//  TALaunchDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TALaunchDependencyContainer {
    
    func makeLaunchViewController() -> TALaunchViewController {
        let launchViewModel = makeLaunchViewModel()
        let vc = TALaunchViewController(viewModel: launchViewModel)
        return vc
    }

    private func makeLaunchViewModel() -> TALaunchViewModel {
        return TALaunchViewModel()
    }
    
}
