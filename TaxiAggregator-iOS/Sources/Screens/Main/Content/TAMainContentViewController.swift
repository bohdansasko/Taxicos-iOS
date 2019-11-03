//
//  TAMainContentViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAMainContentViewController: TABaseViewController {
    let viewModel: TAMainContentViewModel
    let launchViewController: TALaunchViewController
    let makeOnboardingViewController: () -> TAOnboardingViewController
    
    init(viewModel: TAMainContentViewModel,
         launchViewController: TALaunchViewController,
         onboardingFactory: @escaping () -> TAOnboardingViewController) {
        self.viewModel                    = viewModel
        self.launchViewController         = launchViewController
        self.makeOnboardingViewController = onboardingFactory
        super.init()
    }
    
    override func loadView() {
        view = TAMainContentRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
