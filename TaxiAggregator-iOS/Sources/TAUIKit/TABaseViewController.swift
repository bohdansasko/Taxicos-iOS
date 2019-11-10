//
//  TABaseViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

class TABaseViewController: UIViewController {
    
    // MARK: - Rx variables
    
    let disposeBag = DisposeBag()
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        log.debug("☠️ deinit \(self)")
    }
        
    @available(*, unavailable, message: "")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Navigation

extension TABaseViewController {
    
    func clearNavigationBar() {
        guard let navBar = navigationController?.navigationBar else {
            assertionFailure()
            return
        }
        navBar.shadowImage = UIImage()
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.backgroundColor = .clear
        navBar.isTranslucent = true
    }
    
}
