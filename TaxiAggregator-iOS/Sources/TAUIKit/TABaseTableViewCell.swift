//
//  TABaseTableViewCell.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 05.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

class TABaseTableViewCell: UITableViewCell {

    let separatorLineView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        return v
    }()
    
    var isSeparatorHidden: Bool = false {
        didSet {
            separatorLineView.isHidden = isSeparatorHidden
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable, message: "")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
