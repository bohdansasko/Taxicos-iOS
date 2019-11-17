//
//  TAHomeRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAHomeRootView: TABaseView {
    fileprivate let viewModel: TAHomeViewModel
    
    // MARK: - UI Elements
    
//    fileprivate let pickupDropoffView: TAPickupDropoffNavigationBar = {
//        return TAPickupDropoffNavigationBar()
//    }()
    
    let mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate let destinationView: TASearchDestinationView = {
        let view = TASearchDestinationView()
        return view
    }()
    
//    fileprivate let dropdownAddresessTable: UITableView = {
//        let tv = TAUIFactory.makeTableView()
//        tv.backgroundColor = .white
//        return tv
//    }()
    
//    fileprivate let presenter: TADropdownAddresessPresenter!
    
    // MARK: - View lifecycle
    
    init(frame: CGRect = .zero, viewModel: TAHomeViewModel) {
        self.viewModel = viewModel
//        self.presenter = TADropdownAddresessPresenter(tableView: dropdownAddresessTable)
        
        super.init(frame: frame)
        
        themeProvider.register(observer: self)
        setupLayout()
//        bringSubviewToFront(pickupDropoffView)
    }
    
}

// MARK: - Setup

private extension TAHomeRootView {
    
    func setupLayout() {
//        addSubview(pickupDropoffView)
//        pickupDropoffView.snp.makeConstraints {
//            $0.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin)
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.height.equalTo(100)
//        }
//        pickupDropoffView.menuButton.addTarget(
//            viewModel,
//            action: #selector(TAHomeViewModel.actMenuButton)
//        )
        
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
//
//        addSubview(dropdownAddresessTable)
//        dropdownAddresessTable.snp.makeConstraints {
//            $0.edges.equalTo(mapContainerView)
//        }
    }
    
}

// MARK: - TAThemeable

extension TAHomeRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor                   = theme.colors.backgroundColor
//        pickupDropoffView.backgroundColor = theme.colors.backgroundColor
    }

}
