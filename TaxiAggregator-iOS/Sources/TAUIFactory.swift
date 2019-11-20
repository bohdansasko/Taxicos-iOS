//
//  TAUIFactory.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAUIFactory {
    private init() {}
}

extension TAUIFactory {
    
    static func makeTableView() -> UITableView {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }
    
    static func makeTextField(placeholder: String?, tintColor: UIColor) -> TATextField {
        let tf = TATextField()
        tf.textField.placeholder = placeholder
        tf.textField.tintColor = tintColor
        return tf
    }
    
}
