//
//  TAChooseOnMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TAChooseOnMapViewModel {
    private let _idleAddress = PublishSubject<TAAddressModel>()
}

// MARK: - Rx Getters

extension TAChooseOnMapViewModel {
    
    var idleAddress: Observable<TAAddressModel> {
        return _idleAddress.asObservable()
    }

}

// MARK: - User interaction

extension TAChooseOnMapViewModel {
    
    @objc func actConfirmLocation(_ sender: Any) {
        log.info()
    }

}

// MARK: - TAIdleLocationResponder

extension TAChooseOnMapViewModel: TAIdleLocationResponder {
    
    func idleLocation(at address: TAAddressModel) {
        _idleAddress.onNext(address)
    }
    
}

