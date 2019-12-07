//
//  TAMenuItemType.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

enum TAMenuItemType: Int, CaseIterable {
    case savedLocations = 0
    case shareApp
    case feedback
    case rateApp
}

// MARK: - Getters

extension TAMenuItemType {
    
    var icon: UIImage {
        switch self {
        case .savedLocations:
            return #imageLiteral(resourceName: "icHome")
        case .shareApp:
            return #imageLiteral(resourceName: "icShareApp")
        case .feedback:
            return #imageLiteral(resourceName: "icFeedback")
        case .rateApp:
            return #imageLiteral(resourceName: "icRateApp")
        }
    }
    
    var title: String {
        switch self {
        case .savedLocations:
            return "MENU_ITEM_SAVED_LOCATIONS".localized
        case .shareApp:
            return "MENU_ITEM_SHARE_APP".localized
        case .feedback:
            return "MENU_ITEM_FEEDBACK".localized
        case .rateApp:
            return "MENU_ITEM_RATE_APP".localized
        }
    }
    
}
