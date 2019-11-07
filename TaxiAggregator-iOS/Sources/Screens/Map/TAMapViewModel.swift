//
//  TAMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps
import RxSwift

final class TAMapViewModel: NSObject {
    
    private let locationManager  = CLLocationManager()

    let myLocation                = PublishSubject<CLLocation>()
//    let myAddress                 = PublishSubject<CLLocation>()
    let isMyLocationEnabled       = BehaviorSubject<Bool>(value: true)
    let isVisibleMyLocationButton = BehaviorSubject<Bool>(value: true)

    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocationIfNeeded() {
        if CLLocationManager.locationServicesEnabled() {
            return
        }
        locationManager.requestLocation()
    }
    
}

// MARK: - User interactions

extension TAMapViewModel {
    
    @objc func actMyLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}

// MARK: - CLLocationManagerDelegate

extension TAMapViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedAlways || status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        myLocation.onNext(location)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
}

