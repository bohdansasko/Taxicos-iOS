//
//  TAErrorMessage.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 10.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

struct TAErrorMessage: Error {
    var id: UUID
    var title: String?
    var message: String?
    
    init(title: String?, message: String?) {
        self.id      = UUID()
        self.title   = title
        self.message = message
    }
    
}
