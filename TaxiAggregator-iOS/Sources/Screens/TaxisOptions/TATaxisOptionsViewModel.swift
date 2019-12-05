//
//  TATaxisOptionsViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TATaxisOptionsViewModel {
    
    // MARK: - Private properties
    
    private var _items = BehaviorSubject<[TATaxiOptionModel]>(value: TATaxiOptionModel.mockOptions())
    
    private let _fromAddress: TAAddressModel
    private let _toAddress: TAAddressModel
    
    // MARK: - Getters

    var items: Observable<[TATaxiOptionModel]> {
        return _items.asObserver()
    }
    
    let kCellHeight: Float = 78

    // MARK: - Methods
    
    init(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) {
        _fromAddress = fromAddress
        _toAddress = toAddress
    }
    
}

// MARK: - User interaction

extension TATaxisOptionsViewModel {
    
    func actTaxiField(at indexPath: IndexPath) {
        log.info("")
    }
    
}

// MARK: - Getters

extension TATaxisOptionsViewModel {
    
    var numberOfItems: Int {
        let count = (try? _items.value().count) ?? 0
        return count
    }
    
    func item(for indexPath: IndexPath) -> TATaxiOptionModel {
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
