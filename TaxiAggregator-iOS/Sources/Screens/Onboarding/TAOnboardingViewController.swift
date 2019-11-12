//
//  TAOnboardingViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingViewController: TABaseViewController {
    
    // MARK: - Properties
    
    private let viewModel: TAOnboardingViewModel
    private let onboardingFactory: TAOnboardingFactory
    
    // MARK: - View lifecycle
    
    init(viewModel: TAOnboardingViewModel, onboardingFactory: TAOnboardingFactory) {
        self.viewModel = viewModel
        self.onboardingFactory = onboardingFactory
        
        super.init()
    }

    override func loadView() {
        let pages = [
            onboardingFactory.makeFirstPageViewController(),
            onboardingFactory.makeSecondPageViewController(),
            onboardingFactory.makeThirdPageViewController()
        ]
        view = TAOnboardingRootView(viewModel: viewModel, pages: pages)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
