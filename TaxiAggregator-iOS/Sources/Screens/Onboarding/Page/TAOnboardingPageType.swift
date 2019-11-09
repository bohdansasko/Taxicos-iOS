//
//  TAOnboardingPageType.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

enum TAOnboardingPageType {
    case first
    case second
    case third
}

extension TAOnboardingPageType {
    
    var title: String {
        switch self {
        case .first:
            return "ONBOARDING_FIRST_PAGE".localized
        case .second:
            return "ONBOARDING_SECOND_PAGE".localized
        case .third:
            return "ONBOARDING_THIRD_PAGE".localized
        }
    }
    
    var image: UIImage {
        switch self {
        case .first:
            return #imageLiteral(resourceName: "icOnboardingFirst")
        case .second:
            return #imageLiteral(resourceName: "icOnboardingSecond")
        case .third:
            return #imageLiteral(resourceName: "icOnboardingThird")
        }
    }
    
}
