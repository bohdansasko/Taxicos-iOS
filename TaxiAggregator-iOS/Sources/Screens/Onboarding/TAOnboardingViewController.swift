//
//  TAOnboardingViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingViewController: TABaseViewController {
    let viewModel: TAOnboardingViewModel
    
    init(viewModel: TAOnboardingViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func loadView() {
        view = TAOnboardingRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
