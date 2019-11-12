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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = " "
    }
    
}

// MARK: - Handle navigation bar visibility

extension TABaseViewController {

    func hideNavigationBar(animated: Bool) {
        let isNavigationBarHidden = navigationController?.isNavigationBarHidden ?? true
        guard !isNavigationBarHidden else {
            return
        }
        navigationController!.setNavigationBarHidden(true, animated: animated)
    }

    func showNavigationBar(animated: Bool) {
        guard let _ = navigationController?.isNavigationBarHidden else {
            return
        }

        guard animated else {
            navigationController!.setNavigationBarHidden(false, animated: animated)
            return
        }
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.navigationController!.setNavigationBarHidden(false, animated: animated)
        })
    }

}
