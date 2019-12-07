//
//  TAMainRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAMainRootView: TABaseView {
    let viewModel: TAMainViewModel
    
    init(frame: CGRect = .zero, viewModel: TAMainViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - TAThemeable

extension TAMainRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
