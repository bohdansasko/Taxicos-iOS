//
//  TAOnboardingDependencyContainer.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingDependencyContainer {

    func makeOnboardingViewController() -> TAOnboardingViewController {
        let onboardingViewModel = makeOnboardingViewModel()
        return TAOnboardingViewController(viewModel: onboardingViewModel)
    }
    
    private func makeOnboardingViewModel() -> TAOnboardingViewModel {
        return TAOnboardingViewModel()
    }
    
}
