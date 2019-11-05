//
//  TAMapRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa

final class TAMapRootView: TABaseView {
    let viewModel: TAMapViewModel
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        map.isMyLocationEnabled = true
        return map
    }()
    
    fileprivate let pickupDropoffView: TAPickupDropoffNavigationBar = {
        return TAPickupDropoffNavigationBar()
    }()
    
    init(frame: CGRect = .zero, viewModel: TAMapViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
                
        setupLayout()
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

private extension TAMapRootView {
    
    func setupLayout() {
        addSubview(pickupDropoffView)
        
        pickupDropoffView.menuButton.addTarget(
            viewModel,
            action: #selector(TAMapViewModel.actMenuButton)
        )
        
        pickupDropoffView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(pickupDropoffView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - TAThemeable

extension TAMapRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
