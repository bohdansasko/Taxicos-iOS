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
    private let viewModel: TAMapViewModel
    private var kMapZoom: Float { return 15 }
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    fileprivate let pickupDropoffView: TAPickupDropoffNavigationBar = {
        return TAPickupDropoffNavigationBar()
    }()
    
    fileprivate let myLocationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "icMyLocation"), for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    init(frame: CGRect = .zero, viewModel: TAMapViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
                
        setupLayout()
        themeProvider.register(observer: self)
        subscribeToViewModel()
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
        
        addSubview(myLocationButton)
        myLocationButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(2)
            $0.bottom.equalToSuperview().inset(32)
        }
        myLocationButton.addTarget(
            viewModel,
            action: #selector(TAMapViewModel.actMyLocation(_:))
        )
    }
    
}

// MARK: - Setup

private extension TAMapRootView {
    
    func subscribeToViewModel() {
        viewModel
            .isMyLocationEnabled
            .subscribe(onNext: { [weak self] isEnabled in
                self?.mapView.isMyLocationEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        viewModel
            .isVisibleMyLocationButton
            .subscribe(onNext: { [weak self] isVisible in
                self?.myLocationButton.isHidden = !isVisible
            })
            .disposed(by: disposeBag)
        
        viewModel
            .myLocation
            .subscribe(onNext: { [weak self] location in
                guard let self = self else { return }
                
                let cameraPos = GMSCameraPosition(
                    target: location.coordinate,
                    zoom: self.kMapZoom
                )
                self.mapView.animate(to: cameraPos)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - TAThemeable

extension TAMapRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
