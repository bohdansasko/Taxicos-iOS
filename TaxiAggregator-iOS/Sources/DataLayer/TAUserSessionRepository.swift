//
//  TAUserSessionRepository.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 10.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit

protocol TAUserSessionRepository {
    func readUserSession() -> Promise<TAUserSession?>
    func signIn() -> Promise<TAUserSession>
}
