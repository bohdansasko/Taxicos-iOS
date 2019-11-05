//
//  TALaunchRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TALaunchRootView: TABaseView {
    let viewModel: TALaunchViewModel
    
    init(frame: CGRect = .zero, viewModel: TALaunchViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
    }
    
}


// MARK: - TAThemeable

extension TALaunchRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
