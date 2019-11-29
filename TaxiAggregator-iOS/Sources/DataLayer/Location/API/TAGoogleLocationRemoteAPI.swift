//
//  TAVinsoLocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit
import GooglePlaces
import Alamofire

final class TAGoogleLocationRemoteAPI {
    private let _placesClient: GMSPlacesClient
    private let _sessionToken: GMSAutocompleteSessionToken
    
    init() {
        _placesClient = GMSPlacesClient()
        _sessionToken = GMSAutocompleteSessionToken()
    }
    
}

// MARK: - TALocationRemoteAPI

extension TAGoogleLocationRemoteAPI: TALocationRemoteAPI {
    
    func getLocationSearchResults(query: String) -> Promise<[TAAddressModel]> {
        return Promise { [weak self] seal in
            if query.isEmpty {
                seal.fulfill([])
                return
            }
            
            self?._placesClient.findAutocompletePredictions(fromQuery: query, bounds: nil, boundsMode: .bias, filter: nil, sessionToken: _sessionToken, callback: { results, error in

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
