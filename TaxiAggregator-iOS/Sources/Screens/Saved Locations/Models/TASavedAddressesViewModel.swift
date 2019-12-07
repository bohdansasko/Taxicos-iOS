//
//  TASavedAddressesViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxRelay

final class TASavedAddressesViewModel {
    
    // MARK: - Properties
    
    fileprivate var _items = BehaviorRelay<[TAAddressModel]>(value: [])
    fileprivate let _dataStore: TASavedAddressesDataStore
    
    fileprivate let _activityIndicatorAnimating = BehaviorRelay<Bool>(value: false)
    
    let kItemHeight: Float = 56
    
    // MARK: - Lifecycle
    
    init(dataStore: TASavedAddressesDataStore) {
        _dataStore = dataStore
    }
    
}

// MARK: - Fetching

extension TASavedAddressesViewModel {
 
    func fetchAddresses() {
        _activityIndicatorAnimating.accept(true)
        
        _dataStore.readAddresses()
            .done { cachedItems in
                self._items.accept(cachedItems)
            }
            .catch { err in
                let error = TAErrorMessage(title: "Saved addresses", message: "Couldn't fetch saved addresses")
                fatalError("unexpected behaviour - \(error)")
            }.finally {
                self._activityIndicatorAnimating.accept(false)
            }
    }
    
}

// MARK: - Rx Getters

extension TASavedAddressesViewModel {
    
    var items: Observable<[TAAddressModel]> {
        return _items.asObservable()
    }
    
    var activityIndicatorAnimating: Observable<Bool> {
        return _activityIndicatorAnimating.asObservable()
    }
    
}

// MARK: - Getters

extension TASavedAddressesViewModel {
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        let items = _items.value
        return items[indexPath.row]
    }
    
    var numberOfItems: Int {
        let count = _items.value.count
        return count
    }
}

