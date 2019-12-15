//
//  TAChooseLocationOnMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxCocoa
import RxRelay
import GoogleMaps

protocol TAIdleLocationResponder {
    func idleLocation(at address: TAAddressModel)
}

final class TAChooseLocationOnMapViewModel {
    
    // MARK: - Internal properties
    
    private let _myLocationRemoteAPI: TAMyLocationRemoteAPI
    private let _geocodeRemoteAPI   : TAGoogleGeocodeRemoteAPI
    private let _idleLocationResponder: TAIdleLocationResponder
    
    private let _isMyLocationEnabled       = BehaviorRelay<Bool>(value: true)
    private let _isVisibleMyLocationButton = BehaviorRelay<Bool>(value: true)
    
    // MARK: - Lifecycle
    
    init(myLocationRemoteAPI: TAMyLocationRemoteAPI, geocodeRemoteAPI: TAGoogleGeocodeRemoteAPI, idleLocationResponder: TAIdleLocationResponder) {
        _myLocationRemoteAPI = myLocationRemoteAPI
        _geocodeRemoteAPI    = geocodeRemoteAPI
        _idleLocationResponder = idleLocationResponder
        
        _myLocationRemoteAPI.determineMyLocation()
    }
    
}

// MARK: - User interaction

extension TAChooseLocationOnMapViewModel {
    
    @objc func actDetermineMyLocation(_ sender: Any) {
        _myLocationRemoteAPI.determineMyLocation()
    }

}

// MARK: - Rx Getters

extension TAChooseLocationOnMapViewModel {
    
    var myLocation: Observable<CLLocation> {
        return _myLocationRemoteAPI.myLocation
    }
    
    var isMyLocationEnabled: Observable<Bool> {
        return _isMyLocationEnabled.asObservable()
    }
    
    var isVisibleMyLocationButton: Observable<Bool> {
        return _isVisibleMyLocationButton.asObservable()
    }
    
}

// MARK: - API

extension TAChooseLocationOnMapViewModel {
    
    func reverseGeocodeCoordinate(for coordinate: CLLocationCoordinate2D) {
        _geocodeRemoteAPI.reverseGeocodeCoordinate(with: coordinate)
        .done { [weak self] address in
            self?._idleLocationResponder.idleLocation(at: address)
        }.catch { err in
            // TODO: add error handler
        }
    }
    
}
