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

final class TAChooseLocationOnMapViewModel {
    
    // MARK: - Internal properties
    
    private let _myLocationRemoteAPI: TAMyLocationRemoteAPI
    
    private let _isMyLocationEnabled       = BehaviorRelay<Bool>(value: true)
    private let _isVisibleMyLocationButton = BehaviorRelay<Bool>(value: true)
    
    // MARK: - Lifecycle
    
    init(myLocationRemoteAPI: TAMyLocationRemoteAPI) {
        _myLocationRemoteAPI = myLocationRemoteAPI
        
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
    
}
