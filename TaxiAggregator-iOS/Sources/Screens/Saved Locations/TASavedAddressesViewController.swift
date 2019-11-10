//
//  TASavedAddressesViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASavedAddressesViewController: TABaseViewController {
    let viewModel: TASavedAddressesViewModel
    
    init(viewModel: TASavedAddressesViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TASavedAddressesRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SAVED_LOCATIONS_TITLE".localized
    }

}
