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
            return "Saved locations"
        case .shareApp:
            return "Share app"
        case .feedback:
            return "Feedback"
        case .rateApp:
            return "Rate app"
        }
    }
    
}
