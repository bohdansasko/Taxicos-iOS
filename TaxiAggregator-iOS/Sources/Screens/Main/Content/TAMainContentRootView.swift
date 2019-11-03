//
//  TAMainContentRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAMainContentRootView: TABaseView {
    let viewModel: TAMainContentViewModel
    
    init(frame: CGRect = .zero, viewModel: TAMainContentViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
    }
    
}
