//
//  TALocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TALocationRemoteAPI {
    func getLocationSearchResults(query: String) -> Promise<[TAAddressModel]>
}
