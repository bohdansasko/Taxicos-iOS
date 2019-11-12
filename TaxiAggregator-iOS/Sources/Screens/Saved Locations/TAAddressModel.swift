//
//  TAAddressModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/12/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps

struct TAAddressModel {
    var shortAddress: String
    var fullAddress : String
    var location    : CLLocationCoordinate2D
}

extension TAAddressModel {
    
    static func mockModels() -> [TAAddressModel] {
        return [
            TAAddressModel(shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0)),
            TAAddressModel(shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0)),
            TAAddressModel(shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0)),
            TAAddressModel(shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0))
        ]
    }
    
}
