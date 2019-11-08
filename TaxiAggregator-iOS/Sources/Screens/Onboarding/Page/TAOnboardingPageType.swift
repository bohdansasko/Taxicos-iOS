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
            return "Пошук потрібної локації для майбутньої поїздки1"
        case .second:
            return "Пошук потрібної локації для майбутньої поїздки2"
        case .third:
            return "Пошук потрібної локації для майбутньої поїздки3"
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
