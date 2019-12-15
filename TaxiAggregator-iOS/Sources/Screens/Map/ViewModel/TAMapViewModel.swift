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

final class TAMapViewModel: NSObject {
    
    // MARK: - Private properties
    
    private let _locationManager           = CLLocationManager()
    
    private let _myLocation                = PublishSubject<CLLocation>()
    private let _isMyLocationEnabled       = BehaviorRelay<Bool>(value: true)
    private let _isVisibleMyLocationButton = BehaviorRelay<Bool>(value: true)
    
    private let _recognizeUserLocationResponder: TARecognizeUserLocationResponder
    
    // MARK: - Getters
    
    var myLocation: Observable<CLLocation> {
        return _myLocation.asObservable()
    }
    
    var isMyLocationEnabled: Observable<Bool> {
        return _isMyLocationEnabled.asObservable()
    }
    
    var isVisibleMyLocationButton: Observable<Bool> {
        return _isVisibleMyLocationButton.asObservable()
    }

    // MARK: - Methods
    
    init(recognizeUserLocationResponder: TARecognizeUserLocationResponder) {
        _recognizeUserLocationResponder = recognizeUserLocationResponder
        
        super.init()
        
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

}

// MARK: - Help methods

extension TAMapViewModel {
    
    func requestLocationIfNeeded() {
        if CLLocationManager.locationServicesEnabled() {
            return
        }
        _locationManager.requestLocation()
    }
    
    
}

// MARK: - User interactions

extension TAMapViewModel {
    
    @objc func actMyLocation(_ sender: UIButton) {
        _locationManager.requestLocation()
    }
    
}

// MARK: - CLLocationManagerDelegate

extension TAMapViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedAlways || status == .authorizedWhenInUse else {
            return
        }
        _locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        manager.stopUpdatingLocation()
        
        _myLocation.onNext(location)
        _recognizeUserLocationResponder.didUpdateLocation(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
}

