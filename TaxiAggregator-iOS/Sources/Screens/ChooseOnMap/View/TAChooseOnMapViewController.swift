//
//  TAChooseOnMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAChooseOnMapViewController: TABaseViewController, TARootView {
    typealias RootViewType = TAChooseOnMapRootView
    
    // MARK: - Properties
    
    private let _viewModel: TAChooseOnMapViewModel
    
    // MARK: - UI
    
    private let _chooseOnMapViewController: TAChooseLocationOnMapViewController
    private let _addressView: TAAddressView
    
    // MARK: - Lifecycle
    
    init(viewModel: TAChooseOnMapViewModel, chooseOnMapViewController: TAChooseLocationOnMapViewController, addressView: TAAddressView) {
        _viewModel = viewModel
        _chooseOnMapViewController = chooseOnMapViewController
        _addressView = addressView
        
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add(child: _chooseOnMapViewController, to: rootView.mapContainerView)
        
        rootView.addressContainerView.addSubview(_addressView)
        _addressView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
}
