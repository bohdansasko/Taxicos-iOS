//
//  TAMainMenuRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SnapKit
import SideMenu

final class TAMainMenuRootView: TABaseView {
    let viewModel: TAMainMenuViewModel
    
    fileprivate let tableMenu: UITableView = {
        let table = UITableView()
        table.register(class: TALeftSideMenuCell.self)
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    
    fileprivate let logoView: UIView = {
        let view = UIView()
        
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "icLogo")
        view.addSubview(logo)
        logo.snp.makeConstraints{ $0.centerX.centerY.equalToSuperview() }
        
        return view
    }()
    
    let items: [TAMenuItem] = [
        TAMenuItem(icon: #imageLiteral(resourceName: "icHome")    , title: "Saved locations"),
        TAMenuItem(icon: #imageLiteral(resourceName: "icShareApp"), title: "Share app"),
        TAMenuItem(icon: #imageLiteral(resourceName: "icFeedback"), title: "Feedback"),
        TAMenuItem(icon: #imageLiteral(resourceName: "icRateApp") , title: "Rate app")
    ]
    
    init(frame: CGRect = .zero, viewModel: TAMainMenuViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupLayout()
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

extension TAMainMenuRootView {
    
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

extension TAMainMenuRootView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(class: TALeftSideMenuCell.self, for: indexPath)
        cell.item = items[indexPath.row]
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension TAMainMenuRootView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

// MARK: - TAThemeable

extension TAMainMenuRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}
