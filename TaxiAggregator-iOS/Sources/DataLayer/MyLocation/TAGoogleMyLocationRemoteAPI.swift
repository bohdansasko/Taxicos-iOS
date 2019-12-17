//
//  TAGoogleMyLocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps
import RxSwift

final class TAGoogleMyLocationRemoteAPI: NSObject {
    private let _locationManager = CLLocationManager()
    private let _myLocation = PublishSubject<CLLocation>()
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
}

// MARK: - Setup

private extension TAGoogleMyLocationRemoteAPI {

    func setupLocationManager() {
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
}

// MARK: - Rx Getters

extension TAGoogleMyLocationRemoteAPI {

    var myLocation: Observable<CLLocation> {
        return _myLocation.asObservable()
    }
    
}

// MARK: - TAMyLocationRemoteAPI

extension TAGoogleMyLocationRemoteAPI: TAMyLocationRemoteAPI {
    
    func determineMyLocation() {
        _locationManager.requestLocation()
        _locationManager.startUpdatingLocation()
    }
    
}


// MARK: - CLLocationManagerDelegate

extension TAGoogleMyLocationRemoteAPI: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedAlways || status == .authorizedWhenInUse else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        manager.stopUpdatingLocation()
        _myLocation.onNext(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
}
