//
//  TASearchDestinationViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/19/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxRelay

final class TASearchDestinationViewModel {
    
    // MARK: - Private properties
    
    private let _dataStore: TASearchHistoryDataStore
    private let _searchDestinationResponder: TASearchDestinationResponder
    
    private var _items = BehaviorRelay<[TAAddressModel]>(value: [])
    
    // MARK: - Public properties
    
    var items: Observable<[TAAddressModel]> {
        return _items.asObservable()
    }
    
    let kCellHeight: Float = 60
    
    // MARK: - Lifecycle
    
    init(dataStore: TASearchHistoryDataStore, searchDestinationResponder: TASearchDestinationResponder) {
        _dataStore = dataStore
        _searchDestinationResponder = searchDestinationResponder
    }
    
}

// MARK: - User interaction

extension TASearchDestinationViewModel {

    func actAddressField(at indexPath: IndexPath) {
        let addressModel = item(for: indexPath)
        _searchDestinationResponder.setDestinationAddress(to: addressModel)
    }

    @objc func actSearchDestinationButton() {
        _searchDestinationResponder.setDestinationAddress(to: nil)
    }
    
}

// MARK: - Help

extension TASearchDestinationViewModel {
    
    func fetchHistory() {
        _dataStore.fetchSearchHistory()
        .done { [unowned self] items in
            self._items.accept(items)
        }.catch { err in
            log.error(err)
        }
    }
    
}

// MARK: - Getters

extension TASearchDestinationViewModel {
    
    var numberOfItems: Int {
        let count = _items.value.count
        return count
    }
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        let items = _items.value
        return items[indexPath.row]
    }
    
    func isLastItem(by indexPath: IndexPath) -> Bool {
        let items = _items.value
        return (indexPath.row + 1) == items.count
    }
    
}
