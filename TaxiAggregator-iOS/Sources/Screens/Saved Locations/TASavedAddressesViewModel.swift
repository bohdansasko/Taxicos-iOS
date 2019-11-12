//
//  TASavedAddressesViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TASavedAddressesViewModel {
    
    // MARK: - Properties
    
    fileprivate var _items = BehaviorSubject<[TAAddressModel]>(value: [])
    fileprivate let _dataStore: TASavedAddressesDataStore
    
    fileprivate let _activityIndicatorAnimating = BehaviorSubject<Bool>(value: false)
    
    var items: Observable<[TAAddressModel]> {
        return _items.asObservable()
    }
    
    var activityIndicatorAnimating: Observable<Bool> {
        return _activityIndicatorAnimating.asObservable()
    }
    
    let kItemHeight: Float = 56
    
    // MARK: - Methods
    
    init(dataStore: TASavedAddressesDataStore) {
        _dataStore = dataStore
    }
    
}

// MARK: - Fetching

extension TASavedAddressesViewModel {
 
    func fetchAddresses() {
        _activityIndicatorAnimating.onNext(true)
        
        _dataStore.readAddresses()
            .ensure {
                self._activityIndicatorAnimating.onNext(false)
            }
            .done { cachedItems in
                self._items.onNext(cachedItems)
            }
            .catch { err in
                let error = TAErrorMessage(title: "Saved addresses", message: "Couldn't fetch saved addresses")
                fatalError("unexpected behaviour - \(error)")
            }
    }
    
}

// MARK: - Getters

extension TASavedAddressesViewModel {
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        do {
            let items = try _items.value()
            return items[indexPath.row]
        } catch (let err) {
            fatalError("unexpected behaviour - \(err)")
        }
    }
    
    var numberOfItems: Int {
        let count = try? _items.value().count
        return count ?? 0
    }
}

