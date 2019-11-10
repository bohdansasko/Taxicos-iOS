//
//  TARootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 09.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

protocol TARootView {
    associatedtype RootViewType
    var rootView: RootViewType! { get }
}

extension TARootView where Self: UIViewController {
    
    var rootView: RootViewType! {
        return view as? RootViewType
    }
    
}
