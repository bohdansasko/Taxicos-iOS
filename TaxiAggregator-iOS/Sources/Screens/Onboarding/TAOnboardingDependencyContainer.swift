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
        return TAOnboardingViewController(viewModel: onboardingViewModel, onboardingFactory: self)
    }
    
    private func makeOnboardingViewModel() -> TAOnboardingViewModel {
        return TAOnboardingViewModel()
    }
    
}

// MARK: - TAOnboardingFactory

extension TAOnboardingDependencyContainer: TAOnboardingFactory {
    
    func makeFirstPageViewController() -> UIViewController {
        return TAOnboardingPageViewController(pageType: .first)
    }
    
    func makeSecondPageViewController() -> UIViewController {
        return TAOnboardingPageViewController(pageType: .second)
    }
    
    func makeThirdPageViewController() -> UIViewController {
        return TAOnboardingPageViewController(pageType: .third)
    }
    
}
