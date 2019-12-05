//
//  TATaxiProviderType.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/4/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

enum TATaxiOptionType {
    case unknown
    case bolt
    case uklon
    case uber
    case taxi7000
    case taxi838
}

// MARK: - Getters

extension TATaxiOptionType {
    
    var icon: UIImage? {
        switch self {
        case .bolt:
            return #imageLiteral(resourceName: "icBoltLogo")
        case .uklon:
            return #imageLiteral(resourceName: "icUklonLogo")
        case .uber:
            return #imageLiteral(resourceName: "icUberLogo")
        case .taxi7000:
            return #imageLiteral(resourceName: "icTaxi7000Logo")
        case .taxi838:
            return #imageLiteral(resourceName: "ic838Logo")
        case .unknown:
            return nil
        }
    }
    
}
