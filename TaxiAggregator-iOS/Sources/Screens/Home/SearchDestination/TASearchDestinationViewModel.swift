//
//  TASearchDestinationViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/19/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TASearchDestinationViewModel {
    
    // MARK: - Private properties
    
    private let _dataStore: TASearchHistoryDataStore
    private let _searchDestinationResponder: TASearchDestinationResponder
    
    private var _items    = BehaviorSubject<[TAAddressModel]>(value: [])
    
    // MARK: - Public properties
    
    var items: Observable<[TAAddressModel]> {
        return _items.asObserver()
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
        _searchDestinationResponder.setDestinationAddress(addressModel)
    }

    @objc func actSearchDestinationButton() {
        _searchDestinationResponder.setDestinationAddress(nil)
    }
    
}

// MARK: - Help

extension TASearchDestinationViewModel {
    
    func fetchHistory() {
        _dataStore.fetchSearchHistory()
        .done { [unowned self] items in
            self._items.onNext(items)
        }.catch { err in
            log.error(err)
        }
    }
    
}

// MARK: - Getters

extension TASearchDestinationViewModel {
    
    var numberOfItems: Int {
        let count = (try? _items.value().count) ?? 0
        return count
    }
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        guard let items = try? _items.value() else {
            fatalError("fix me")
        }
        return items[indexPath.row]
    }
    
    func isLastItem(by indexPath: IndexPath) -> Bool {
        guard let items = try? _items.value() else {
            fatalError("fix me")
        }
        return (indexPath.row + 1) == items.count
    }
    
}
