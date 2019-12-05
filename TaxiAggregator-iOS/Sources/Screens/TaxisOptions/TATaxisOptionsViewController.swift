//
//  TATaxisOptionsViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TATaxisOptionsViewController: TABaseViewController, TARootView {
    typealias RootViewType = TATaxisOptionsRootView
    
    // MARK: - Properties
    
    private let viewModel: TATaxisOptionsViewModel
    
    // MARK: - View lifecycle
    
    init(viewModel: TATaxisOptionsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TAXIS_OPTIONS_TITLE".localized
    }
    
}

