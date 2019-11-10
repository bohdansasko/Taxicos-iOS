//
//  TAMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SideMenu
import RxSwift

final class TAMapViewController: TABaseViewController {
    
    // MARK: - Internal variables
    
    let viewModel: TAMapViewModel
    
    // MARK: - View lifecycle
    
    init(viewModel: TAMapViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TAMapRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.requestLocationIfNeeded()
    }
    
}

