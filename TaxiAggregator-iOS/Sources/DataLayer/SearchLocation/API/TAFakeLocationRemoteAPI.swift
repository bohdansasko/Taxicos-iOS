//
//  TAFakeLocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 27.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFakeLocationRemoteAPI {

}

// MARK: - TALocationRemoteAPI

extension TAFakeLocationRemoteAPI: TALocationRemoteAPI {

    func getLocationSearchResults(query: String) -> Promise<[TAAddressModel]> {
        return Promise { seal in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                let results = TAAddressModel
                    .searchResultsModels()
                    .filter { $0.fullAddress.contains(query) }
                seal.fulfill(results)
            }
        }
    }
    
}
