//
//  TAAddressModel.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/12/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import GoogleMaps

struct TAAddressModel {
    var icon: UIImage
    var shortAddress: String
    var fullAddress : String
    var location    : CLLocationCoordinate2D
    var isFavVisible: Bool = false
    var timestamp   : TimeInterval
}

// MARK: - Fake models

extension TAAddressModel {
    
    static func searchResultsModels() -> [TAAddressModel] {
        return [
            TAAddressModel(icon: #imageLiteral(resourceName: "icDropoff"),
                           shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icDropoff"),
                           shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icDropoff"),
                           shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icDropoff"),
                           shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970)
        ]
    }
    
    static func historyModels() -> [TAAddressModel] {
        return [
            TAAddressModel(icon: #imageLiteral(resourceName: "icHistory"),
                           shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icHistory"),
                           shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icHistory"),
                           shortAddress: "Birsten st. London ",
                           fullAddress: "Hourse 57, road-8, Block-D, niketon...",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970),
            TAAddressModel(icon: #imageLiteral(resourceName: "icHistory"),
                           shortAddress: "Birsten st. Lviv, Ukrain",
                           fullAddress: "Mirpur Rd, Dhanmondi 32 Bustop",
                           location: .init(latitude: 0, longitude: 0),
                           timestamp: Date().timeIntervalSince1970)
        ]
    }
    
}
