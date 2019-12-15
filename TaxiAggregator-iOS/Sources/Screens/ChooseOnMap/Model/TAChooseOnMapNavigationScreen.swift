//
//  TAChooseOnMapNavigationScreen.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TAChooseOnMapNavigationScreen {
    case destination(address: TAAddressModel)
}

extension TAChooseOnMapNavigationScreen: Equatable {

    static func ==(lhs: TAChooseOnMapNavigationScreen, rhs: TAChooseOnMapNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.destination(l), .destination(r)):
            return l == r
        }
    }
    
}
