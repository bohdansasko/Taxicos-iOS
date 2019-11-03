//
//  TAUserSessionDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

protocol TAUserSessionDataStore {
    
}

final class TADatabaseSessionDataStore: TAUserSessionDataStore {
    let coder: TAUserSessionCoding
    
    init(with coder: TAUserSessionCoding) {
        self.coder = coder
    }
}

