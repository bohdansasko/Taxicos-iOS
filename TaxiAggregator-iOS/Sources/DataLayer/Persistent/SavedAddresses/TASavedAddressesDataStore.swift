//
//  TASavedAddressesRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 12.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TASavedAddressesDataStore {
    func readAddresses() -> Promise<[TAAddressModel]>
}
