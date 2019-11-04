//
//  TAMainContentRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import GoogleMaps

final class TAPickupDropoffView: TABaseView {
    
    fileprivate let pickupIconView: UIImageView = {
        return UIImageView(image: #imageLiteral(resourceName: "icPickup"))
    }()
    
    fileprivate let pickupTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.font = UIFont(name: "Rubik-Regular", size: 14)
        tf.placeholder = "Enter location"
        return tf
    }()
    
    fileprivate let dropoffIconView: UIImageView = {
        return UIImageView(image: #imageLiteral(resourceName: "icDropoff"))
    }()
    
    fileprivate let dropoffTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .left
        tf.font = UIFont(name: "Rubik-Regular", size: 14)
        tf.placeholder = "Where to?"
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        pickupTF.setContentHuggingPriority(.init(249), for: .horizontal)
        dropoffTF.setContentHuggingPriority(.init(249), for: .horizontal)
        
        let pickupSV = UIStackView(arrangedSubviews: [pickupIconView, pickupTF])
        pickupSV.distribution = .fill
        pickupSV.axis = .horizontal
        pickupSV.spacing = 12
        
        let dropoffSV = UIStackView(arrangedSubviews: [dropoffIconView, dropoffTF])
        dropoffSV.distribution = .fill
        dropoffSV.axis = .horizontal
        dropoffSV.spacing = 12
        
        let combinedSV = UIStackView(arrangedSubviews: [pickupSV, dropoffSV])
        combinedSV.axis = .vertical
        combinedSV.distribution = .fill
        combinedSV.spacing = 8
        addSubview(combinedSV)
        
        combinedSV.snp.makeConstraints {
            $0.left.equalToSuperview().inset(50)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
}

final class TAMainContentRootView: TABaseView {
    let viewModel: TAMainContentViewModel
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        map.isMyLocationEnabled = true
        return map
    }()
    
    fileprivate let selectRideView: TAPickupDropoffView = {
        let view = TAPickupDropoffView()
        return view
    }()
    
    init(frame: CGRect = .zero, viewModel: TAMainContentViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(selectRideView)
        selectRideView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(140)
        }
        
        addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(selectRideView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension TAMainContentRootView {
    
}
