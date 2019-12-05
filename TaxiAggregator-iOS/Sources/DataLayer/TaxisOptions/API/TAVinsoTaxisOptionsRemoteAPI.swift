//
//  TAVinsoTaxisOptionsRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/5/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

final class TAVinsoTaxisOptionsRemoteAPI {
   
}

// MARK: - TATaxisOptionsRemoteAPI

extension TAVinsoTaxisOptionsRemoteAPI: TATaxisOptionsRemoteAPI {
    
    func getTaxisOptions(from fromAddress: TAAddressModel, to toAddress: TAAddressModel) -> Promise<[TATaxiOptionModel]> {
        return Promise { seal in
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(2)) {
                seal.fulfill(TATaxiOptionModel.mockOptions())
            }
        }
    }
    
}
