//
//  TATaxisOptionsRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TATaxisOptionsRepository {
    func getTaxisOptions(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> Promise<[TATaxiOptionModel]>
}
