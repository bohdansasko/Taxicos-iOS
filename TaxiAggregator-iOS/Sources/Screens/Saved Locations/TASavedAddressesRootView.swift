//
//  TASavedAddressesRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASavedAddressesRootView: TABaseView {
    let viewModel: TASavedAddressesViewModel
    
    init(frame: CGRect = .zero, viewModel: TASavedAddressesViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
    }
    
}


// MARK: - TAThemeable

extension TASavedAddressesRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
