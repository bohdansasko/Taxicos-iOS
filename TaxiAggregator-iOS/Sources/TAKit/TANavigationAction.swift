
//
//  TANavigationAction.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

enum TANavigationAction<ViewModelType: Equatable>: Equatable {
    case present(screen: ViewModelType)
}
