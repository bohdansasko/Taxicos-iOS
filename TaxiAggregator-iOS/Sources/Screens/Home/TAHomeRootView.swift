//
//  TAHomeRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAHomeRootView: TABaseView {
    
    // MARK: - Properties
    
    fileprivate let viewModel: TAHomeViewModel
    
    // MARK: - UI Elements
    
    let menuButton: UIButton = {
        let menuIcon = #imageLiteral(resourceName: "icMenu").withRenderingMode(.alwaysOriginal)
        let menuButton = UIButton(type: .system)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.setImage(menuIcon, for: .normal)
        menuButton.contentMode = .scaleAspectFit
        return menuButton
    }()
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate let destinationView: TASearchDestinationView = {
        let view = TASearchDestinationView()
        return view
    }()
    
    // MARK: - View lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAHomeViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
    }
    
}

// MARK: - Setup

private extension TAHomeRootView {
    
    func setupLayout() {
        backgroundColor = .clear
        
        menuButton.addTarget(
            viewModel,
            action: #selector(TAHomeViewModel.actMenuButton)
        )
        
        addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        addSubview(destinationView)
        destinationView.snp.makeConstraints {
            $0.top.equalTo(mapContainerView.snp.bottom).inset(6)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
}
