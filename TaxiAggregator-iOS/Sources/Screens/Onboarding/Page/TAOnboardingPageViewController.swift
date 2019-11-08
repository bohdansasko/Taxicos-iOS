//
//  TAOnboardingPageViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingPageViewController: TABaseViewController {
    let pageType : TAOnboardingPageType
    
    init(pageType: TAOnboardingPageType) {
        self.pageType = pageType
        super.init()
    }
    
    override func loadView() {
        view = TAOnboardingPageRootView(pageType: pageType)
    }
    
}
