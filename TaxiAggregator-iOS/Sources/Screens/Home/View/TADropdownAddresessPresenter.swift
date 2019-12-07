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
    
    func item(for indexPath: IndexPath) -> CellModel {
        return items[indexPath.row]
    }
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
    private let _section = TADropdownAddresessSection<TAAddressModel>(items:
        TAAddressModel.searchResultsModels()
    )
    
    init(tableView: UITableView) {
        _tableView = tableView
        
        super.init()
        
        setupTableView()
    }
    
}

private extension TADropdownAddresessPresenter {
    
    func setupTableView() {
        _tableView.register(class: TAAddressCell.self)
        _tableView.dataSource = self
        _tableView.delegate   = self
    }
    
}

// MARK: - UITableViewDataSource

extension TADropdownAddresessPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _section.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(class: TAAddressCell.self, for: indexPath)
        return cell
    }

}

// MARK: - UITableViewDelegate

extension TADropdownAddresessPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let addressModel = _section.item(for: indexPath)
        let addressCell = cell as! TAAddressCell
        addressCell.set(addressModel: addressModel)
    }
    
}
