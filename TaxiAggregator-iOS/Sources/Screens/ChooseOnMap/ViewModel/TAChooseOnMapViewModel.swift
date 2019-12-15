//
//  TAChooseOnMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

typealias TAChooseOnMapNavigationAction = TANavigationAction<TAChooseOnMapNavigationScreen>

protocol TAConfirmAddressOnMapResponder {
    func confirmAddress(_ address: TAAddressModel, addressType: TAActiveAddressTyping)
}

final class TAChooseOnMapViewModel {
            let addressType: TAActiveAddressTyping
    private let _confirmAddressResponder: TAConfirmAddressOnMapResponder
    

    private var _selectedAddress: TAAddressModel?
    private let _idleAddress = PublishSubject<TAAddressModel>()
    private let _navigationAction = PublishSubject<TAChooseOnMapNavigationAction>()
    
    init(addressType: TAActiveAddressTyping, confirmAddressResponder: TAConfirmAddressOnMapResponder) {
        self.addressType = addressType
        _confirmAddressResponder = confirmAddressResponder
    }
}

// MARK: - Rx Getters

extension TAChooseOnMapViewModel {
    
    var idleAddress: Observable<TAAddressModel> {
        return _idleAddress.asObservable()
    }

    var navigationAction: Observable<TAChooseOnMapNavigationAction> {
        return _navigationAction.asObservable()
    }

}

// MARK: - User interaction

extension TAChooseOnMapViewModel {
    
    @objc func actConfirmLocation(_ sender: Any) {
        guard let selectedAddress = _selectedAddress else {
            assertionFailure("fix me")
            return
        }
        _confirmAddressResponder.confirmAddress(selectedAddress, addressType: addressType)
        _navigationAction.onNext(.present(screen: .destination(address: selectedAddress)))
    }

}

// MARK: - TAIdleLocationResponder

extension TAChooseOnMapViewModel: TAIdleLocationResponder {
    
    func idleLocation(at address: TAAddressModel) {
        _selectedAddress = address
        _idleAddress.onNext(address)
    }
    
}

