//
//  TADestinationNavigationScreen.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/7/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TADestinationNavigationScreen {
    case showTaxisOptions(from: TAAddressModel, to: TAAddressModel)
    case chooseLocationOnMap
}

extension TADestinationNavigationScreen: Equatable {

    static func ==(lhs: TADestinationNavigationScreen, rhs: TADestinationNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.showTaxisOptions(l), .showTaxisOptions(r)):
            return l == r
        case (.chooseLocationOnMap, .chooseLocationOnMap):
            return true
        case (.showTaxisOptions, _),
             (.chooseLocationOnMap, _):
            return false
        }
    }
    
}
