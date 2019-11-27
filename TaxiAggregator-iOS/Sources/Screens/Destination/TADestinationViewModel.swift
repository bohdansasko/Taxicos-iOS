//
//  TADestinationViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TADestinationViewModel {
    
    // MARK: - Internal properties
    
    private let _locationRepository: TALocationRepository
    private let _addressesResults = BehaviorSubject<[TAAddressModel]>(value: [])
    
    // MARK: - Observables
    
    var addressesResults: Observable<[TAAddressModel]> {
        return _addressesResults.asObservable()
    }
    
    // MARK: - Static properties
    
    let kCellHeight: Float = 60
    
    // MARK: - Lifecycle
    
    init(locationRepository: TALocationRepository) {
        _locationRepository = locationRepository
    }
    
}

// MARK: - User interaction

extension TADestinationViewModel {

    func searchForLocations(using query: String) {
        guard !query.isEmpty else  { return }
        
        _locationRepository.searchForLocations(using: query)
        .done { [weak self] items in
            items.forEach { log.info($0.fullAddress, " -> ", $0.shortAddress) }
            self?._addressesResults.onNext(items)
        }.catch { err in
            log.error(err)
        }
    }
    
    func actAddressField(at indexPath: IndexPath) {
//        let addressModel = item(for: indexPath)
    }
    
    @objc func actChooseLocationOnMap(_ sender: Any) {
        log.debug("")
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
