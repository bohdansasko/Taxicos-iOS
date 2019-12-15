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
    case chooseLocationOnMap(currentAddress: TAAddressModel, addressType: TAActiveAddressTyping)
}

extension TADestinationNavigationScreen: Equatable {

    static func ==(lhs: TADestinationNavigationScreen, rhs: TADestinationNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.showTaxisOptions(l), .showTaxisOptions(r)):
            return l == r
        case let (.chooseLocationOnMap(l, ll), .chooseLocationOnMap(r, rr)):
            return l == r && ll == rr
        case (.showTaxisOptions, _),
             (.chooseLocationOnMap, _):
            return false
        }
    }
    
}
