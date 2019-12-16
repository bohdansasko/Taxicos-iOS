//
//  TADestinationViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxCocoa
import RxRelay

typealias TADestinationNavigationAction = TANavigationAction<TADestinationNavigationScreen>

final class TADestinationViewModel {
    
    // MARK: - Internal vars
    
    private let _locationRepository: TALocationRepository
    
    private let _disposeBag = DisposeBag()
    
    private let _addressesResults = BehaviorRelay<[TAAddressModel]>(value: [])
    private let _navigationAction = PublishSubject<TADestinationNavigationAction>()
    
    private let _currentAddress: TAAddressModel
    
    private let _fromAddress = BehaviorRelay<TAAddressModel?>(value: nil)
    private let _toAddress   = BehaviorRelay<TAAddressModel?>(value: nil)
    
    // MARK: - Public vars
    
    let activeAddressTyping = BehaviorRelay<TAActiveAddressTyping>(value: .to)
    
    // MARK: - Getters
    
    let kCellHeight: Float = 60
    
    private var isReadyToSearchTaxis: Bool {
        guard let _ = _fromAddress.value,
              let _ = _toAddress.value else {
                return false
        }
        return true
    }
    
    // MARK: - Lifecycle

    init(locationRepository: TALocationRepository, from fromAddress: TAAddressModel) {
        _locationRepository = locationRepository
        _currentAddress     = fromAddress
        
        _fromAddress.accept(_currentAddress)
    }
    
}

// MARK: - Observables getters

extension TADestinationViewModel {

    var navigationAction: Observable<TADestinationNavigationAction> {
        return _navigationAction.asObservable()
    }
    
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
        let count = _addressesResults.value.count
        return count
    }
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        let items = _addressesResults.value
        return items[indexPath.row]
    }
    
    func isLastItem(by indexPath: IndexPath) -> Bool {
        let items = _addressesResults.value
        return (indexPath.row + 1) == items.count
    }

}

// MARK: - Help methods

private extension TADestinationViewModel {

    func clearSelectedAddress() {
        switch activeAddressTyping.value {
        case .from:
            _fromAddress.accept(nil)
        case .to:
            _toAddress.accept(nil)
        }
    }
    
}

// MARK: - User interaction

extension TADestinationViewModel {
    
    func actAddressField(at indexPath: IndexPath) {
        let address = item(for: indexPath)
        
        switch activeAddressTyping.value {
        case .from:
            _fromAddress.accept(address)
        case .to:
            _toAddress.accept(address)
        }
        _addressesResults.accept([])
        
        guard let fromAddress = _fromAddress.value,
              let toAddress = _toAddress.value else {
            return
        }
        
        if isReadyToSearchTaxis {
            _navigationAction.onNext(.present(screen: .showTaxisOptions(from: fromAddress, to: toAddress)))
        }
    }
    
    @objc func actChooseLocationOnMap(_ sender: Any) {
        switch activeAddressTyping.value {
        case .from:
            let address = _fromAddress.value ?? _currentAddress
            _navigationAction.onNext(.present(screen: .chooseLocationOnMap(currentAddress: address, addressType: .from)))
        case .to:
            let address = _toAddress.value ?? _currentAddress
            _navigationAction.onNext(.present(screen: .chooseLocationOnMap(currentAddress: address, addressType: .to)))
        }
    }

}

// MARK: - API

extension TADestinationViewModel {

    func searchForLocations(using query: String) {
        guard !query.isEmpty else  {
            _addressesResults.accept([])
            clearSelectedAddress()
            return
        }

        _locationRepository.searchForLocations(using: query)
            .done { [weak self] items in
                guard let self = self else { return }

                if items.isEmpty {
                    self.clearSelectedAddress()
                }
                self._addressesResults.accept(items)
            }.catch { err in
                log.error(err)
            }
    }

}

// MARK: - TAConfirmAddressOnMapResponder

extension TADestinationViewModel: TAConfirmAddressOnMapResponder {
    
    func confirmAddress(_ address: TAAddressModel, addressType: TAActiveAddressTyping) {
        switch activeAddressTyping.value {
        case .from:
            _fromAddress.accept(address)
        case .to:
            _toAddress.accept(address)
        }
    }

}
