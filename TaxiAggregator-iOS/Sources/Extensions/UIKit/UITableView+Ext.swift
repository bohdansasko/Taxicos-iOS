//
//  UITableView+Extension.swift
//  exmo-ios-client
//
//  Created by Bogdan Sasko on 7/14/19.
//  Copyright © 2019 Bogdan Sasko. All rights reserved.
//

import UIKit

// MARK: - Cell

extension UITableView {
    
    /// Register nib for reuse
    func register<T: UITableViewCell>(nib cell: T.Type) {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    /// Register class for reuse
    func register<T: UITableViewCell>(class cell: T.Type) {
        let className = String(describing: cell)
        register(cell.self, forCellReuseIdentifier: className)
    }
    
    /// Returns reusable cell
    func dequeue<T: UITableViewCell>(class cell: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: cell)
        return dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
    
}

// MARK: - Header/Footer

extension UITableView {

    /// Register class for reuse header
    func register<T: UITableViewHeaderFooterView>(nibForHeaderFooter cell: T.Type) {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forHeaderFooterViewReuseIdentifier: className)
    }
    
    /// Register class for reuse header
    func register<T: UITableViewHeaderFooterView>(classForHeaderFooter cell: T.Type) {
        let className = String(describing: cell)
        register(cell.self, forHeaderFooterViewReuseIdentifier: className)
    }
    
    /// Returns reusable cell
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass view: T.Type) -> T {
        let className = String(describing: view)
        return dequeueReusableHeaderFooterView(withIdentifier: className) as! T
    }
    
}
