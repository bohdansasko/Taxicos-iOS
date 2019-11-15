//
//  TADropdownAddresessPresenter.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

struct TAActionModel {
    var icon: UIImage?
    var text: String?
}

struct TADropdownAddresessSection<CellModel> {
    var items: [CellModel]
}

extension TADropdownAddresessSection {
    
    init() {
        self.items = []
    }
    
}

typealias TAActionsSection = TADropdownAddresessSection<TAActionModel>
typealias TAAddressesSection = TADropdownAddresessSection<TAActionModel>

final class TADropdownAddresessPresenter: NSObject {
    private let _tableView: UITableView
    private let _sections = [
        TADropdownAddresessSection<TAActionModel>(items: [
            TAActionModel(icon: #imageLiteral(resourceName: "icVector"), text: "SEARCH_RESULTS_CHOOSE_ON_MAP".localized)
        ]),
        TADropdownAddresessSection<TAAddressModel>(items: [])
    ]
    
    init(tableView: UITableView) {
        _tableView = tableView
        
        super.init()
        
        setupTableView()
    }
    
}

private extension TADropdownAddresessPresenter {
    
    func setupTableView() {
        _tableView.register(class: TASetLocationOnMapCell.self)
        _tableView.register(class: TAAddressCell.self)
        _tableView.dataSource = self
        _tableView.delegate   = self
    }
    
}

// MARK: - UITableViewDataSource

extension TADropdownAddresessPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

// MARK: - UITableViewDelegate

extension TADropdownAddresessPresenter: UITableViewDelegate {
      
}
