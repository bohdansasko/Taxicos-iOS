//
//  TADestinationViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TADestinationViewController: TABaseViewController, TARootView {
    typealias RootViewType = TADestinationRootView
    
    // MARK: - Properties
    
    private let _viewModel: TADestinationViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: TADestinationViewModel) {
        _viewModel = viewModel
        
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem?.title = " "
        navigationItem.title = "SET_DESTINATION".localized
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.backgroundColor = .white
    }
    
}
