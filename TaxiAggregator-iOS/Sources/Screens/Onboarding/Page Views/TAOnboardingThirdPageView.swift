//
//  TAOnboardingThirdPageView.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingThirdPageView: TABaseView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
}

private extension TAOnboardingThirdPageView {
    
    func setupLayout() {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "icOnboardingThird"))
        addSubview(imgView)
        imgView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
