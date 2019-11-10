//
//  UIViewController+Ext.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 06.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

extension UIViewController {

    func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        addFullScreenConstraints(view: view, childView: child.view)
        child.didMove(toParent: self)
    }

    func add(child: UIViewController, to childContainerView: UIView) {
        addChild(child)
        childContainerView.addSubview(child.view)
        addFullScreenConstraints(view: childContainerView, childView: child.view)
        child.didMove(toParent: self)
    }
    
    func remove(child: UIViewController?) {
        guard let child = child else {
            return
        }

        guard child.view != nil else {
            return
        }
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    private func addFullScreenConstraints(view: UIView, childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            view.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            view.topAnchor.constraint(equalTo: childView.topAnchor),
            view.bottomAnchor.constraint(equalTo: childView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        view.addConstraints(constraints)
    }
    
}
