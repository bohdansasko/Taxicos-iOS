//
//  TASavedAddressesViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation

final class TASavedAddressesViewModel {
    fileprivate var items: [TAAddressModel]
    
    let kItemHeight: Float = 56
    
    init() {
        items = TAAddressModel.mockModels()
    }
    
}

// MARK: - Getters

extension TASavedAddressesViewModel {
    
    func item(for indexPath: IndexPath) -> TAAddressModel {
        return items[indexPath.row]
    }
    
    var numberOfItems: Int {
        return items.count
    }
}

