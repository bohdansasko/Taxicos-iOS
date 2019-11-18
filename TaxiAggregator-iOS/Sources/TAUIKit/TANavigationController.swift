//
//  TANavigationController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 11.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TANavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backIcon =  #imageLiteral(resourceName: "icArrowLeft").withRenderingMode(.alwaysOriginal)
        navigationBar.backIndicatorImage = backIcon
        navigationBar.backIndicatorTransitionMaskImage = backIcon
               
        themeProvider.register(observer: self)
    }
    
}

// MARK: - TAThemeable

extension TANavigationController: TAThemeable {
    
    func apply(theme: TATheme) {
        navigationBar.titleTextAttributes = [
            .font: UIFont.rubik(weight: .medium, fontSize: 22),
            .foregroundColor: theme.colors.titleColor
        ]
        navigationBar.backgroundColor = theme.colors.backgroundColor
    }
    
}
