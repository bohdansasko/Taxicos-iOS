//
//  TASearchHistoryDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/19/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TASearchHistoryDataStore {
    func fetchSearchHistory() -> Promise<[TAAddressModel]>
}
