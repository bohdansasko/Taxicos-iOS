//
//  TAFakeTaxisOptionsRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAFakeTaxisOptionsRepository {
    private let _remoteAPI: TATaxisOptionsRemoteAPI
       
    init(remoteAPI: TATaxisOptionsRemoteAPI) {
       _remoteAPI = remoteAPI
    }
   
}

// MARK: - TATaxisOptionsRepository

extension TAFakeTaxisOptionsRepository: TATaxisOptionsRepository {
    
    func getTaxisOptions(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> Promise<[TATaxiOptionModel]> {
        let items = _remoteAPI.getTaxisOptions(from: fromAddress, to: toAddress)
        return items
    }
    
}
