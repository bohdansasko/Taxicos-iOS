//
//  TAHomeViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import GooglePlaces

typealias TAHomeNavigationAction = TANavigationAction<TAHomeNavigationScreen>

final class TAHomeViewModel {
    
    // MARK: - Properties
    
    private let _geocodeRemoteAPI: TAGeocodeRemoteAPI
    private let _menuResponder: TAOpenLeftMenuResponder
    
    private let _navigationAction = PublishSubject<TAHomeNavigationAction>()
    private var _myCurrentAddress: TAAddressModel?
    
    // MARK: - Lifecycle
    
    init(geocodeRemoteAPI: TAGeocodeRemoteAPI, menuResponder: TAOpenLeftMenuResponder) {
        _geocodeRemoteAPI = geocodeRemoteAPI
        _menuResponder    = menuResponder
    }
    
}

// MARK: - User interactions

extension TAHomeViewModel {
    
    @objc func actMenuButton() {
        _menuResponder.goToLeftMenu()
    }
    
}

// MARK: - TASearchDestinationResponder

extension TAHomeViewModel: TASearchDestinationResponder {

    func setDestinationAddress(to toAddressModel: TAAddressModel?) {
        guard let fromAddress = _myCurrentAddress else {
            assertionFailure("required")
            return
        }
        
        switch toAddressModel {
        case .none:
            let destinationScreen: TAHomeNavigationScreen = .setDestination(from: fromAddress)
            _navigationAction.onNext(.present(screen: destinationScreen))
        case .some(let toAddress):
            _navigationAction.onNext(.present(screen: .showTaxisOptions(from: fromAddress, to: toAddress)))
        }
    }
    
}

// MARK: - Rx getters

extension TAHomeViewModel {
    
    var navigationAction: Observable<TAHomeNavigationAction> {
        return _navigationAction.asObservable()
    }
    
}

// MARK: - TARecognizeUserLocationResponder

extension TAHomeViewModel: TARecognizeUserLocationResponder {
    
    func didUpdateLocation(_ location: CLLocation) {
        _geocodeRemoteAPI.reverseGeocodeCoordinate(with: location.coordinate)
            .done { [weak self] geocodedAddress in
                self?._myCurrentAddress = geocodedAddress
            }
            .catch { err in
                log.error(err.localizedDescription)
            }
    }
    
}


