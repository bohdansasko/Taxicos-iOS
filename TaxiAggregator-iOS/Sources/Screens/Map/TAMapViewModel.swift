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
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
}

