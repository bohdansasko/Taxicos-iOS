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
        let contentView = makeContentPageView(by: pageType)
        view = TAOnboardingPageRootView(contentPageView: contentView)
    }

    private func makeContentPageView(by pageType: TAOnboardingPageType) -> UIView {
        switch pageType {
        case .first:
            return TAOnboardingFirstPageView()
        case .second:
            return TAOnboardingSecondPageView()
        case .third:
            return TAOnboardingThirdPageView()
        }
    }
    
}
