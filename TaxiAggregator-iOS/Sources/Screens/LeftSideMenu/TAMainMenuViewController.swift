//
//  TAMainMenuViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAMainMenuViewController: TABaseViewController {
    let viewModel: TAMainMenuViewModel
    
    init(viewModel: TAMainMenuViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TAMainMenuRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
