//
//  TAAppSavedAddressesRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 12.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFakeSavedAddressesDataStore {
    
}

// MARK: - TASavedAddressesDataStore

extension TAFakeSavedAddressesDataStore: TASavedAddressesDataStore {
    
    func readAddresses() -> Promise<[TAAddressModel]> {
        return Promise { seal in
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5)) {
                seal.fulfill(TAAddressModel.searchResultsModels())
            }
        }
    }
    
}

