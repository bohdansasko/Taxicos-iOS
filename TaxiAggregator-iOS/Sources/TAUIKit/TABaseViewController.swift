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

// MARK: - View controller presentation

extension TABaseViewController {

    func push(viewController: UIViewController, animated: Bool = true) {
        guard let nav = navigationController else {
            assertionFailure("required")
            return
        }
        nav.pushViewController(viewController, animated: animated)
    }

    func close() {
        let poppedVC = navigationController?.popViewController(animated: true)
        if poppedVC == nil  {
            dismiss(animated: true)
        }
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

// MARK: - Displaying errors

extension TABaseViewController {

    func handleError(_ errorMsg: TAErrorMessage) {
        showAlert(title: errorMsg.title, message: errorMsg.message)
    }
    
    func showAlert(title: String?, message: String?, comment: String? = nil) {
        showAlert(title: title, message: message, comment: comment, okTitle: "OK".localized, okActionHandler: nil)
    }
    
    func showAlert(title: String?, message: String?, comment: String?, okTitle: String?, okActionHandler: ((UIAlertAction) -> Void)?) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okActionHandler)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: nil)
    }
    
}
