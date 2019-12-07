//
//  TASavedAddressesViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASavedAddressesViewController: TABaseViewController, TARootView {
    typealias RootViewType = TASavedAddressesRootView
    
    private let viewModel: TASavedAddressesViewModel
    
    // MARK: - View lifecycle
    
    init(viewModel: TASavedAddressesViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SAVED_LOCATIONS_TITLE".localized
        viewModel.fetchAddresses()
    }

}
