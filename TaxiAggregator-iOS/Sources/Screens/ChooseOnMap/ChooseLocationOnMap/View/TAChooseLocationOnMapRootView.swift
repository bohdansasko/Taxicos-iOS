//
//  TAChooseLocationOnMapRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import GoogleMaps

final class TAChooseLocationOnMapRootView: TABaseView {
    
    // MARK: - Properties
    
    private let _viewModel: TAChooseLocationOnMapViewModel
    
    // MARK: - UI
    
    fileprivate let mapView: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    fileprivate let myLocationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "icMyLocation"), for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    // MARK: - Lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAChooseLocationOnMapViewModel) {
        _viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        setupSubscriptions()
        themeProvider.register(observer: self)
        
        myLocationButton.addTarget(_viewModel, action: #selector(_viewModel.actDetermineMyLocation(_:)))
    }
}

// MARK: - Setup

private extension TAChooseLocationOnMapRootView {
    
    func setupLayout() {
        addSubview(mapView)
        mapView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        addSubview(myLocationButton)
        myLocationButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(2)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupSubscriptions() {
        _viewModel
            .isMyLocationEnabled
            .subscribe(onNext: { [weak self] isEnabled in
                self?.mapView.isMyLocationEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        _viewModel
            .isVisibleMyLocationButton
            .subscribe(onNext: { [weak self] isVisible in
                self?.myLocationButton.isHidden = !isVisible
            })
            .disposed(by: disposeBag)
        
        _viewModel
            .myLocation
            .subscribe(onNext: { [weak self] location in
                guard let self = self else { return }
                
                let cameraPos = GMSCameraPosition(
                    target: location.coordinate,
                    zoom: TAConfig.Map.kMapZoom
                )
                self.mapView.animate(to: cameraPos)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - TAThemeable

extension TAChooseLocationOnMapRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
    }

}
