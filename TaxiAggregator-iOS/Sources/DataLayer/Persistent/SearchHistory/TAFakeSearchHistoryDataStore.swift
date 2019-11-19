//
//  TAFakeSearchHistoryDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/19/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFakeSearchHistoryDataStore {
    
}

// MARK: - TASearchHistoryDataStore

extension TAFakeSearchHistoryDataStore: TASearchHistoryDataStore {
    
    func fetchSearchHistory() -> Promise<[TAAddressModel]> {
        return Promise { seal in
            let items = Array(TAAddressModel.historyModels().prefix(3))
                            .sorted(by: { $0.timestamp < $1.timestamp })
            seal.fulfill(items)
        }
    }
    
}
