//
//  Date+Extension.swift
//  exmo-ios-client
//
//  Created by Office Mac on 9/7/19.
//  Copyright © 2019 Bogdan Sasko. All rights reserved.
//

import Foundation

extension Date {
    
    var formattedNow: String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let today = Date()
        return df.string(from: today)
    }
    
}
