//
//  TATaxicosLocationRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit
import GoogleMaps
import RxSwift

final class TAVinsoLocationRepository {
    private let _remoteAPI: TALocationRemoteAPI
    
    init(remoteAPI: TALocationRemoteAPI) {
        _remoteAPI = remoteAPI
    }

}

// MARK: - TALocationRepository

extension TAVinsoLocationRepository: TALocationRepository {
    
    func searchForLocations(using query: String) -> Promise<[TAAddressModel]> {
        return _remoteAPI.getLocationSearchResults(query: query)
    }
    
}
