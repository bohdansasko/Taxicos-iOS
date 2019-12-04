//
//  TATaxiModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/4/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

struct TATaxiOptionModel {
    var name : String
    var price: Double
    var providerType : TATaxiOptionType
}

// MARK: - Getters

extension TATaxiOptionModel {

    var title: String? {
        switch providerType {
        case .bolt:
            return "Bolt"
        case .uklon:
            return "Uklon"
        case .uber:
            return "Uber"
        case .taxi7000:
            return "Taxi 7000"
        case .taxi838:
            return "Taxi 838"
        case .unknown:
            return nil
        }
    }
    
    var formattedPrice: String {
        return String(format: "₴%.0f", price)
    }
}

// MARK: - Mock

extension TATaxiOptionModel {

    static func mockOptions() -> [TATaxiOptionModel] {
        return [
            TATaxiOptionModel(name: "Bolt", price: 20, providerType: .bolt),
            TATaxiOptionModel(name: "Uklon", price: 10.8, providerType: .uklon),
            TATaxiOptionModel(name: "Uber", price: 140, providerType: .uber),
            TATaxiOptionModel(name: "Taxi 7000", price: 268, providerType: .taxi7000),
            TATaxiOptionModel(name: "Taxi 838", price: 5, providerType: .taxi838)
        ]
    }
    
}
