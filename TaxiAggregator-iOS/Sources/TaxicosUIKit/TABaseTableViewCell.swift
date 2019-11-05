//
//  TABaseTableViewCell.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 05.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

class TABaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable, message: "")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
