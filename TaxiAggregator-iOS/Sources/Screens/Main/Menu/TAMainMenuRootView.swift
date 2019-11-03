//
//  TAMainMenuRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAMainMenuRootView: TABaseView {
    let viewModel: TAMainMenuViewModel
    
    init(frame: CGRect = .zero, viewModel: TAMainMenuViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
}
