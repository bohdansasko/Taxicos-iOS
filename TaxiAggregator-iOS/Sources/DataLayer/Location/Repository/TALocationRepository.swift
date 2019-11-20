//
//  TALocationRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TALocationRepository {
    func searchForLocations(using query: String) -> Promise<[TAAddressModel]>
}
