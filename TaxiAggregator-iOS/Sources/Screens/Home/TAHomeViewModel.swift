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
    
    private let _menuResponder: TAOpenLeftMenuResponder
    private let _navigationAction = PublishSubject<TAHomeNavigationAction>()
    private let _placesClient: GMSPlacesClient
    
    var navigationAction: Observable<TAHomeNavigationAction> {
        return _navigationAction.asObservable()
    }
    
    // MARK: - Methods
    
    init(menuResponder: TAOpenLeftMenuResponder) {
        _menuResponder = menuResponder
        
        _placesClient = GMSPlacesClient.shared()
        _placesClient.autocompleteQuery("Велика ", bounds: nil, filter: nil, callback: { results, error in
            // do nothing
        })
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
    
    func setDestinationAddress(_ addressModel: TAAddressModel?) {
        _navigationAction.onNext(.present(screen: .setDestination(addressModel)))
    }
    
}
