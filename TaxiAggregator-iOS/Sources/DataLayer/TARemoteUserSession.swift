//
//  TARemoteUserSession.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 09.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

typealias TAAuthToken = String

final class TARemoteUserSession {
    let token: TAAuthToken
    
    init(token: TAAuthToken) {
        self.token = token
    }
    
}

