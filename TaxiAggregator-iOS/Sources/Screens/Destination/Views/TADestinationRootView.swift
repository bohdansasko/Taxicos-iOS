//
//  TADestinationRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TADestinationRootView: TABaseView {
    // MARK: - Properties
    
    // MARK: - UI
    
    private let fromToView: TAPickupDropoffView = {
        let v = TAPickupDropoffView()
        return v
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        themeProvider.register(observer: self)
    }
}


extension TADestinationRootView {
    
    func setupLayout() {
        addSubview(fromToView)
        fromToView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(90)
        }
    }
    
}

// MARK: - TAThemeable

extension TADestinationRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
