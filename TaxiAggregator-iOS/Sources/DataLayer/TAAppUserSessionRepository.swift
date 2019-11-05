//
//  TASharedUserSessionRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TAUserSessionRepository {
    
}

final class TAAppUserSessionRepository: TAUserSessionRepository {
    
    init(dataStore: TAUserSessionDataStore, authRemoteAPI: TAAuthRemoteAPI) {
        
    }
    
}

