//
//  TAOnboardingRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAOnboardingRootView: TABaseView {
    let viewModel: TAOnboardingViewModel
    
    init(frame: CGRect = .zero, viewModel: TAOnboardingViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - TAThemeable

extension TAOnboardingRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
