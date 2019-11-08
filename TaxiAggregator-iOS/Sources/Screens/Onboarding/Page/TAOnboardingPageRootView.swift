//
//  TAOnboardingPageRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingPageRootView: TABaseView {
    
    init(frame: CGRect = .zero, contentPageView: UIView) {
        super.init(frame: frame)
        
        addSubview(contentPageView)
        contentPageView.snp.makeConstraints{ $0.edges.equalToSuperview() }
    }
    
}
