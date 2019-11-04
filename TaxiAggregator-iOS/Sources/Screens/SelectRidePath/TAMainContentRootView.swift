//
//  TAMainContentRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps

final class TAMainContentRootView: TABaseView {
    let viewModel: TAMainContentViewModel
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        map.isMyLocationEnabled = true
        return map
    }()
    
    fileprivate let pickupDropoffView: TAPickupDropoffView = {
        return TAPickupDropoffView()
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
        addSubview(pickupDropoffView)
        pickupDropoffView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(132)
        }
        
        addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(pickupDropoffView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}
