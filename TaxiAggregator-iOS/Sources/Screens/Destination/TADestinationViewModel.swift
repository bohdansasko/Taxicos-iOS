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
    
    private let _pickupAddressResults = BehaviorSubject<[TAAddressModel]>(value: [])
    private let _dropoffAddressResults = BehaviorSubject<[TAAddressModel]>(value: [])
    
    // MARK: - Observables
    
    var pickupAddressResults: Observable<[TAAddressModel]> {
        return _pickupAddressResults.asObservable()
    }

    var dropoffAddressResults: Observable<[TAAddressModel]> {
        return _dropoffAddressResults.asObservable()
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
        _locationRepository.searchForLocations(using: query).done { [weak self] items in
            items.forEach { log.info($0.fullAddress, " -> ", $0.shortAddress) }
            self?._pickupAddressResults.onNext(items)
        }.catch { err in
            log.error(err)
        }
    }
    
    func actAddressField(at indexPath: IndexPath) {
//        let addressModel = item(for: indexPath)
    }

}

// MARK: - Getters

extension TADestinationViewModel {
    
    var numberOfItems: Int {
        let count = (try? _pickupAddressResults.value().count) ?? 0
        return count
    }
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        guard let items = try? _pickupAddressResults.value() else {
            fatalError("fix me")
        }
        return items[indexPath.row]
    }
    
    func isLastItem(by indexPath: IndexPath) -> Bool {
        guard let items = try? _pickupAddressResults.value() else {
            fatalError("fix me")
        }
        return (indexPath.row + 1) == items.count
    }
    
}
