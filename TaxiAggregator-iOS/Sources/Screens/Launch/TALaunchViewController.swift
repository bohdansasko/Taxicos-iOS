//
//  TALaunchViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TALaunchViewController: TABaseViewController {
    let viewModel: TALaunchViewModel
    
    init(viewModel: TALaunchViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TALaunchRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
