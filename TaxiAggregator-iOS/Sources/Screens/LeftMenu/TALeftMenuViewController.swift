//
//  TALeftMenuViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TALeftMenuViewController: TABaseViewController {
    let viewModel: TALeftMenuViewModel
    
    init(viewModel: TALeftMenuViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TALeftMenuRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
