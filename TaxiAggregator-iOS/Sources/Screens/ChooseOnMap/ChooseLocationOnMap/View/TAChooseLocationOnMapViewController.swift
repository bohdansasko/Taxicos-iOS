//
//  TAChooseLocationOnMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAChooseLocationOnMapViewController: TABaseViewController, TARootView {
    typealias RootViewType = TAChooseLocationOnMapRootView
    
    // MARK: - Properties
    
    private let _viewModel: TAChooseLocationOnMapViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: TAChooseLocationOnMapViewModel) {
        _viewModel = viewModel
        
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Setup

private extension TAChooseLocationOnMapViewController {
    
}
