//
//  TAUserSessionDataStore.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TAUserSessionDataStore {
    func readUserSession() -> Promise<TAUserSession?>
    func save(userSession: TAUserSession) -> Promise<TAUserSession>
    func delete(userSession: TAUserSession) -> Promise<TAUserSession>
    
}

