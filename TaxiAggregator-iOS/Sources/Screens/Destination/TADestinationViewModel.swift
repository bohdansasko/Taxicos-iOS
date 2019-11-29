//
//  TADestinationViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxCocoa

final class TADestinationViewModel {
    
    // MARK: - Internal properties
    
    private let _locationRepository: TALocationRepository
    private let _addressesResults = BehaviorSubject<[TAAddressModel]>(value: [])
    
    private var _fromAddress = BehaviorSubject<TAAddressModel?>(value: nil)
    private var _toAddress   = BehaviorSubject<TAAddressModel?>(value: nil)

    let activeAddressTyping = BehaviorRelay<TAActiveAddressTyping>(value: .to)
    
    // MARK: - Static properties
    
    let kCellHeight: Float = 60
    
    var isReadyToSearchTaxis: Bool {
        guard let _ = try? _fromAddress.value(),
              let _ = try? _toAddress.value() else {
                return false
        }
        return true
    }
    
    // MARK: - Lifecycle
    
    init(locationRepository: TALocationRepository, from fromAddress: TAAddressModel?) {
        _locationRepository = locationRepository
        
        _fromAddress.onNext(fromAddress)
    }
    
}

// MARK: - Observables getters

extension TADestinationViewModel {

    var addressesResults: Observable<[TAAddressModel]> {
        return _addressesResults.asObservable()
    }

    var fromAddress: Observable<TAAddressModel?> {
        return _fromAddress.asObservable()
    }

    var toAddress: Observable<TAAddressModel?> {
        return _toAddress.asObservable()
    }

}

// MARK: - Getters

extension TADestinationViewModel {
    
    var numberOfItems: Int {
        let count = (try? _addressesResults.value().count) ?? 0
        return count
    }
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        guard let items = try? _addressesResults.value() else {
            fatalError("fix me")
        }
        return items[indexPath.row]
    }
    
    func isLastItem(by indexPath: IndexPath) -> Bool {
        guard let items = try? _addressesResults.value() else {
            fatalError("fix me")
        }
        return (indexPath.row + 1) == items.count
    }

}

// MARK: - Help methods

private extension TADestinationViewModel {

    func clearSelectedAddress() {
        switch activeAddressTyping.value {
        case .from:
            _fromAddress.onNext(nil)
        case .to:
            _toAddress.onNext(nil)
        }
    }
    
}

// MARK: - User interaction

extension TADestinationViewModel {
    
    func actAddressField(at indexPath: IndexPath) {
        let address = item(for: indexPath)
        
        switch activeAddressTyping.value {
        case .from:
            _fromAddress.onNext(address)
        case .to:
            _toAddress.onNext(address)
        }
        
        if isReadyToSearchTaxis {
            assertionFailure("required implementating")
        }
        _addressesResults.onNext([])
    }
    
    @objc func actChooseLocationOnMap(_ sender: Any) {
        assertionFailure("required implementating")
    }

}

// MARK: - API

extension TADestinationViewModel {

    func searchForLocations(using query: String) {
        guard !query.isEmpty else  {
            _addressesResults.onNext([])
            clearSelectedAddress()
            return
        }

        _locationRepository.searchForLocations(using: query)
            .done { [weak self] items in
                guard let self = self else { return }

                if items.isEmpty {
                    self.clearSelectedAddress()
                }
                self._addressesResults.onNext(items)
            }.catch { err in
                log.error(err)
            }
    }

}