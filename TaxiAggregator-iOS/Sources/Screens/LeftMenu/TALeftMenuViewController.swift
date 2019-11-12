//
//  TALeftMenuViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import StoreKit

final class TALeftMenuViewController: TABaseViewController {
    
    // MARK: - Properties
    
    private let viewModel: TALeftMenuViewModel
    private let leftMenuFactory: TALeftMenuFactory
    
    // MARK: - View lifecycle
    
    init(viewModel: TALeftMenuViewModel, leftMenuFactory: TALeftMenuFactory) {
        self.viewModel       = viewModel
        self.leftMenuFactory = leftMenuFactory
        
        super.init()
    }
    
    override func loadView() {
        view = TALeftMenuRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe(to: viewModel.navigationAction)
    }
    
}

// MARK: - Subscriptions

private extension TALeftMenuViewController {
    
    func subscribe(to navigationAction: Observable<TALeftMenuNavigationAction>) {
        navigationAction
            .asDriver(onErrorRecover: { _ in fatalError("unexpected error in navigation action") })
            .drive(onNext: { [weak self] nextNavigationAction in
                guard let self = self else { return }
                switch nextNavigationAction {
                case .present(let screen):
                    self.present(screen: screen)
                }
                
            })
            .disposed(by: disposeBag)
    }

}

// MARK: - Presentation view controllers

private extension TALeftMenuViewController {

    func present(screen: TALeftMenuNavigationScreen) {
        switch screen {
        case .savedAddresses:
            guard let navController = navigationController else {
                assertionFailure("required")
                return
            }
            let vc = self.leftMenuFactory.makeSavedAddressesViewController()
            navController.pushViewController(vc, animated: true)
        case .shareApp:
            break
        case .feedback:
            break
        case .rateApp:
            SKStoreReviewController.requestReview()
        }
    }
    
}
