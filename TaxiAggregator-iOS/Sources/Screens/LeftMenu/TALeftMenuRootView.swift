//
//  TALeftMenuRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SnapKit
import SideMenu

final class TALeftMenuRootView: TABaseView {
    let viewModel: TALeftMenuViewModel
    let items    : [TAMenuItemType]
    
    fileprivate let tableMenu: UITableView = {
        let table = UITableView()
        table.register(class: TALeftMenuCell.self)
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    
    fileprivate let logoView: UIView = {
        let logoContainerView = UIView()
        
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "icLogo")
        logoContainerView.addSubview(logo)
        logo.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.height.equalToSuperview().multipliedBy(0.6)
            $0.centerX.centerY.equalToSuperview()
        }
        
        return logoContainerView
    }()
    
    init(frame: CGRect = .zero, viewModel: TALeftMenuViewModel) {
        self.viewModel = viewModel
        self.items     = TAMenuItemType.allCases
        
        super.init(frame: frame)
        
        setupLayout()
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

extension TALeftMenuRootView {
    
    func setupLayout() {
        addSubview(logoView)
        logoView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            $0.height.equalTo(182)
        }
        
        addSubview(tableMenu)
        tableMenu.snp.makeConstraints {
            $0.top.equalTo(logoView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        tableMenu.delegate = self
        tableMenu.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource

extension TALeftMenuRootView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(class: TALeftMenuCell.self, for: indexPath)
        cell.item = items[indexPath.row]
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension TALeftMenuRootView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        guard let tappedMenuItem = TAMenuItemType(rawValue: indexPath.row) else {
            assertionFailure("required")
            return
        }
        
        switch tappedMenuItem {
        case .savedLocations:
            viewModel.actSavedLocations(self)
        case .shareApp:
            viewModel.actShareApp(self)
        case .feedback:
            viewModel.actFeedback(self)
        case .rateApp:
            viewModel.actRateApp(self)
        }
    }
    
}

// MARK: - TAThemeable

extension TALeftMenuRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
