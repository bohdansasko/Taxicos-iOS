//
//  TAMainContentRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa

final class TAMainContentRootView: TABaseView {
    let viewModel: TAMainContentViewModel
    let disposeBag = DisposeBag()
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        map.isMyLocationEnabled = true
        return map
    }()
    
    fileprivate let pickupDropoffView: TAPickupDropoffNavigationBar = {
        return TAPickupDropoffNavigationBar()
    }()
    
    init(frame: CGRect = .zero, viewModel: TAMainContentViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupUI()
    }
    
}

// MARK: - Setup

private extension TAMainContentRootView {
    
    func setupUI() {
        backgroundColor = .white
        
        addSubview(pickupDropoffView)
        
        pickupDropoffView.menuButton.addTarget(
            viewModel,
            action: #selector(TAMainContentViewModel.actMenuButton)
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
