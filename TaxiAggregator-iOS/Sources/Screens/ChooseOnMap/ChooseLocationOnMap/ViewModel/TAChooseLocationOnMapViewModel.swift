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
    
    private let _disposeBag = DisposeBag()
    
    private let _myLocationRemoteAPI: TAMyLocationRemoteAPI
    private let _geocodeRemoteAPI   : TAGoogleGeocodeRemoteAPI
    private let _idleLocationResponder: TAIdleLocationResponder
    
    private let _idleLocation = BehaviorSubject<CLLocationCoordinate2D>(value: .init())
    
    private let _isMyLocationEnabled       = BehaviorRelay<Bool>(value: true)
    private let _isVisibleMyLocationButton = BehaviorRelay<Bool>(value: true)
    
    // MARK: - Getters
    
    var mapZoom: Float {
        return TAConfig.Map.kMyLocationMapZoom
    }
    
    // MARK: - Lifecycle
    
    init(myLocationRemoteAPI: TAMyLocationRemoteAPI, geocodeRemoteAPI: TAGoogleGeocodeRemoteAPI,
         idleLocationResponder: TAIdleLocationResponder, currentAddress: TAAddressModel?) {
        _myLocationRemoteAPI   = myLocationRemoteAPI
        _geocodeRemoteAPI      = geocodeRemoteAPI
        _idleLocationResponder = idleLocationResponder
        
        _idleLocation.onNext(currentAddress!.location)
        _myLocationRemoteAPI.myLocation
            .subscribe(onNext: { [weak self] location in
                self?._idleLocation.onNext(location.coordinate)
            })
            .disposed(by: _disposeBag)
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
    
    var myLocation: Observable<CLLocationCoordinate2D> {
        return _idleLocation.asObservable()
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
