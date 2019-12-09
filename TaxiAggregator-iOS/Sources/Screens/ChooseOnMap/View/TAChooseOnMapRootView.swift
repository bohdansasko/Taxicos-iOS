//
//  TAChooseOnMapRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAChooseOnMapRootView: TABaseView {
    private let _viewModel: TAChooseOnMapViewModel
    
    // MARK: - UI
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .rnd
        return view
    }()
    
    let addressContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .rnd
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAChooseOnMapViewModel) {
        _viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
    }
    
}

// MARK: - Setup

private extension TAChooseOnMapRootView {
    
    func setupLayout() {
        addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        addSubview(addressContainerView)
        addressContainerView.snp.makeConstraints {
            $0.top.equalTo(mapContainerView.snp.bottom)
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(180)
        }
    }
    
}
