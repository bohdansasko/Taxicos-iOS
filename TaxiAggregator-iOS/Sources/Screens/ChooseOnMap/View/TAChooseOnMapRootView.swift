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
    
    fileprivate let _addressView: TAAddressView = {
        let view = TAAddressView()
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAChooseOnMapViewModel) {
        _viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        setupIdleAddressSubscription()
        
        themeProvider.register(observer: self)
        
        _addressView.confirmButton.addTarget(_viewModel, action: #selector(_viewModel.actConfirmLocation(_:)))
    }
    
}

// MARK: - Setup

private extension TAChooseOnMapRootView {
    
    func setupLayout() {
        addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
        }
        
        _addressView.set(addressType: _viewModel.addressType)
        addSubview(_addressView)
        _addressView.snp.makeConstraints {
            $0.top.equalTo(mapContainerView.snp.bottom)
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(180)
        }
    }
    
    func setupIdleAddressSubscription() {
        _viewModel.idleAddress
            .subscribe(onNext: { [weak self] address in
                self?._addressView.set(address: address)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: TAThemeable

extension TAChooseOnMapRootView: TAThemeable {
    
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }
    
}
