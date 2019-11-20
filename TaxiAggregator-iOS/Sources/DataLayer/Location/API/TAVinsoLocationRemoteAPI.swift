//
//  TAVinsoLocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit
import GooglePlaces

final class TAVinsoLocationRemoteAPI {
    private let _filter: GMSAutocompleteFilter
    private let _placesClient: GMSPlacesClient
    
    init() {
        _filter = GMSAutocompleteFilter()
        _placesClient = GMSPlacesClient()
        
        _filter.type = .address
    }
    
}

// MARK: - TALocationRemoteAPI

extension TAVinsoLocationRemoteAPI: TALocationRemoteAPI {
    
    func getLocationSearchResults(query: String) -> Promise<[TAAddressModel]> {
        return Promise { [weak self] seal in
            guard let self = self else {
                seal.fulfill([])
                return
            }
            
            self._placesClient.autocompleteQuery(query, bounds: nil, filter: _filter, callback: { results, error in
                log.debug(results)
                guard error == nil else {
                    seal.reject(error!)
                    return
                }
                
                guard let results = results else {
                    seal.fulfill([])
                    return
                }

                let addresses = results.map { TAAddressModel(icon: #imageLiteral(resourceName: "icDropoff"),
                                             shortAddress: $0.attributedPrimaryText.string,
                                             fullAddress: ($0.attributedSecondaryText?.string) ?? "",
                                             location: .init(),
                                             isFavVisible: false,
                                             timestamp: Date().timeIntervalSince1970) }
                seal.fulfill(addresses)
            })
            
        }
    }
    
}
