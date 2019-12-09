//
//  TAChooseLocationOnMapRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAChooseLocationOnMapRootView: TABaseView {
    
    // MARK: - Properties
    
    private let _viewModel: TAChooseLocationOnMapViewModel
    
    // MARK: - Lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAChooseLocationOnMapViewModel) {
        _viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        setupSubscriptions()
        themeProvider.register(observer: self)
    }
}

// MARK: - Setup

private extension TAChooseLocationOnMapRootView {
    
    func setupLayout() {

    }
    
    func setupSubscriptions() {
    
    }
    
}

// MARK: - TAThemeable

extension TAChooseLocationOnMapRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
    }

}
