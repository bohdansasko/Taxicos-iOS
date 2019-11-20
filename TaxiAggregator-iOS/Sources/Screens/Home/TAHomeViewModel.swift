//
//  TAHomeViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

typealias TAHomeNavigationAction = TANavigationAction<TAHomeNavigationScreen>

final class TAHomeViewModel {
    
    // MARK: - Properties
    
    private let _menuResponder: TAOpenLeftMenuResponder
    private let _navigationAction = PublishSubject<TAHomeNavigationAction>()
    
    var navigationAction: Observable<TAHomeNavigationAction> {
        return _navigationAction.asObservable()
    }
    
    // MARK: - Methods
    
    init(menuResponder: TAOpenLeftMenuResponder) {
        _menuResponder = menuResponder
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
