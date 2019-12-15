//
//  TAMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAMapViewController: TABaseViewController, TARootView {
    typealias RootViewType = TAMapRootView
    
    // MARK: - Properties
    
    private let _viewModel: TAMapViewModel
    
    // MARK: - View lifecycle
    
    init(viewModel: TAMapViewModel) {
        self._viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _viewModel.requestCurrentLocation()
    }
    
}

