//
//  TATaxisOptionsViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxRelay

final class TATaxisOptionsViewModel {
    
    // MARK: - Private properties
    
    private let _repository: TATaxisOptionsRepository
    private let _fromAddress: TAAddressModel
    private let _toAddress: TAAddressModel
    
    private let _items = BehaviorRelay<[TATaxiOptionModel]>(value: [])
    private let _activityIndicatorAnimating = BehaviorRelay<Bool>(value: false)
    private let _errorMessage = PublishSubject<Error>()
    
    let kCellHeight: Float = 78

    // MARK: - Lifecycle
    
    init(repository: TATaxisOptionsRepository, from fromAddress: TAAddressModel, to toAddress: TAAddressModel) {
        _repository  = repository
        _fromAddress = fromAddress
        _toAddress   = toAddress
    }
    
}

// MARK: - Network API

extension TATaxisOptionsViewModel {
    
    func fetchTaxisOptions() {
        _activityIndicatorAnimating.accept(true)
        _repository
            .getTaxisOptions(from: _fromAddress, to: _toAddress)
            .done { [weak self] items in
                guard let self = self else { return }
                self._items.accept(items)
            }
            .catch { [weak self] err in
                guard let self = self else { return }
                self._errorMessage.onNext(err)
                log.error(err)
            }
            .finally {
                self._activityIndicatorAnimating.accept(false)
            }
    }
    
}

// MARK: - User interaction

extension TATaxisOptionsViewModel {
    
    func actTaxiField(at indexPath: IndexPath) {
        log.info("")
    }
    
}

// MARK: - Reactive getters

extension TATaxisOptionsViewModel {

    var items: Observable<[TATaxiOptionModel]> {
        return _items.asObservable()
    }
    
    var activityIndicatorAnimating: Observable<Bool> {
        return _activityIndicatorAnimating.asObservable()
    }
    
    var errorMessage: Observable<Error> {
        return _errorMessage.asObservable()
    }
    
}

// MARK: - Datasource getters

extension TATaxisOptionsViewModel {
    
    var numberOfItems: Int {
        let count = _items.value.count
        return count
    }
    
    func item(for indexPath: IndexPath) -> TATaxiOptionModel {
        let items = _items.value
        return items[indexPath.row]
    }
    
}
