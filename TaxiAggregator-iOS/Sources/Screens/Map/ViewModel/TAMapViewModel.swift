//
//  TAMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps
import RxSwift
import RxRelay

protocol TARecognizeUserLocationResponder {
    func didUpdateLocation(_ location: CLLocation)
}

final class TAMapViewModel {
    
    // MARK: - Internal properties
    
    private let _disposeBag = DisposeBag()
    
    private let _isMyLocationEnabled       = BehaviorRelay<Bool>(value: true)
    private let _isVisibleMyLocationButton = BehaviorRelay<Bool>(value: true)
    
    private let _myLocationRemoteAPI: TAMyLocationRemoteAPI
    private let _recognizeUserLocationResponder: TARecognizeUserLocationResponder

    // MARK: - Getters
    
    var mapZoom: Float {
        return TAConfig.Map.kHomeMapZoom
    }
    
    // MARK: - Lifecyle
    
    init(myLocationRemoteAPI: TAMyLocationRemoteAPI, recognizeUserLocationResponder: TARecognizeUserLocationResponder) {
        _myLocationRemoteAPI = myLocationRemoteAPI
        _recognizeUserLocationResponder = recognizeUserLocationResponder

        setupUserLocationSubscription()
    }
    
}

// MARK: - Rx Getters

extension TAMapViewModel {

    var myLocation: Observable<CLLocation> {
        return _myLocationRemoteAPI.myLocation.asObservable()
    }
    
    var isMyLocationEnabled: Observable<Bool> {
        return _isMyLocationEnabled.asObservable()
    }
    
    var isVisibleMyLocationButton: Observable<Bool> {
        return _isVisibleMyLocationButton.asObservable()
    }
    
}

// MARK: - Setup

private extension TAMapViewModel {
    
    func setupUserLocationSubscription() {
        myLocation
            .subscribe(onNext: { [weak self] newLocation in
                self?._recognizeUserLocationResponder.didUpdateLocation(newLocation)
            })
            .disposed(by: _disposeBag)
    }
    
}

// MARK: - Help methods

extension TAMapViewModel {
    
    func requestCurrentLocation() {
        _myLocationRemoteAPI.determineMyLocation()
    }
    
}

// MARK: - User interactions

extension TAMapViewModel {
    
    @objc func actMyLocation(_ sender: UIButton) {
        requestCurrentLocation()
    }
    
}
