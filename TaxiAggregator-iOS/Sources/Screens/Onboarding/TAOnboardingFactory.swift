//
//  TAOnboardingFactory.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TAOnboardingFactory {
    func makeFirstPageViewController()  -> UIViewController
    func makeSecondPageViewController() -> UIViewController
    func makeThirdPageViewController()  -> UIViewController
}
