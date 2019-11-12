//
//  TAHomeRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAHomeRootView: TABaseView {
    fileprivate let viewModel: TAHomeViewModel
    
    // MARK: - UI Elements
    
    fileprivate let pickupDropoffView: TAPickupDropoffNavigationBar = {
        return TAPickupDropoffNavigationBar()
    }()
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - View lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAHomeViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
        setupLayout()
        bringSubviewToFront(pickupDropoffView)
    }
    
}

// MARK: - Setup

private extension TAHomeRootView {
    
    func setupLayout() {
        addSubview(pickupDropoffView)
        pickupDropoffView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(100)
        }
        pickupDropoffView.menuButton.addTarget(
            viewModel,
            action: #selector(TAHomeViewModel.actMenuButton)
        )
        
        addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints {
            $0.top.equalTo(self.pickupDropoffView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - TAThemeable

extension TAHomeRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor                   = theme.colors.backgroundColor
        pickupDropoffView.backgroundColor = theme.colors.backgroundColor
    }

}
