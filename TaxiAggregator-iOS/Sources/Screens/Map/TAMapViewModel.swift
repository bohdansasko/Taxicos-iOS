//
//  TAMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps
import RxSwift

typealias TAMapNavigationAction = TANavigationAction<TAMapNavigationScreen>

final class TAMapViewModel: NSObject {
            let navigationAction = PublishSubject<TAMapNavigationAction>()
    private let locationManager  = CLLocationManager()

    let myLocation                = PublishSubject<CLLocation>()
    let isMyLocationEnabled       = BehaviorSubject<Bool>(value: true)
    let isVisibleMyLocationButton = BehaviorSubject<Bool>(value: true)

    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
}

// MARK: - User interactions

extension TAMapViewModel {

    @objc func actMenuButton(_ sender: UIButton) {
        navigationAction.onNext(.present(.leftMenu))
    }
    
}

// MARK: - CLLocationManagerDelegate

extension TAMapViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            manager.requestWhenInUseAuthorization()
            return
        }
        manager.startUpdatingLocation()
        
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

