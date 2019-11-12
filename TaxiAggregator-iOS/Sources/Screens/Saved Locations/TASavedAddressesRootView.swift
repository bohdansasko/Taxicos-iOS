//
//  TASavedAddressesRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASavedAddressesRootView: TABaseView {
    
    // MARK: - Properties
    
    fileprivate let viewModel: TASavedAddressesViewModel
    
    // MARK: - UI
    
    fileprivate let addressesTable: UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    // MARK: - Methods
    
    init(frame: CGRect = .zero, viewModel: TASavedAddressesViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        themeProvider.register(observer: self)
    }
    
    
    func setupLayout() {
        addressesTable.dataSource = self
        addressesTable.delegate = self
        addressesTable.register(class: TAAddressCell.self)
        addSubview(addressesTable)
        addressesTable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}


// MARK: - TAThemeable

extension TASavedAddressesRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}

// MARK: - UITableViewDataSource

extension TASavedAddressesRootView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(class: TAAddressCell.self, for: indexPath)
        return cell
    }
        
}

// MARK: - UITableViewDelegate

extension TASavedAddressesRootView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.kItemHeight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let addressCell = cell as? TAAddressCell else {
            assertionFailure("required")
            return
        }
        let addressModel = viewModel.item(for: indexPath)
        addressCell.set(addressModel: addressModel)
    }
    
}
