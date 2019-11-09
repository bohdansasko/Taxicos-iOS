//
//  TAOnboardingPageRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/8/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingPageRootView: TABaseView {
    
    init(frame: CGRect = .zero, pageType: TAOnboardingPageType) {
        super.init(frame: frame)
        setupLayout(for: pageType)
    }
    
}

private extension TAOnboardingPageRootView {
    
    func setupLayout(for pageType : TAOnboardingPageType) {
        let imgView = UIImageView(image: pageType.image)
        addSubview(imgView)
        imgView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        let titleLabel = UILabel()
        titleLabel.text = pageType.title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.helvetica(weight: .regular, fontSize: 20)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(imgView.snp.top).offset(-68)
            $0.right.left.equalToSuperview().inset(64)
        }
    }
    
}
