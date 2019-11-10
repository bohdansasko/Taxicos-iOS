//
//  TAMainViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAMainViewController: TABaseViewController {
    private let viewModel: TAMainViewModel
    private let mainFactory: TAMainFactory
    
    private var homeViewController      : TABaseViewController?
    private var onboardingViewController: TABaseViewController?
    
    init(viewModel: TAMainViewModel, mainFactory: TAMainFactory) {
        self.viewModel = viewModel
        self.mainFactory = mainFactory
        
        super.init()
    }

    override func loadView() {
        view = TAMainRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe(to: viewModel.navigationAction)
    }

}

// MARK: - Subscriptions

private extension TAMainViewController {
    
    func subscribe(to navigation: Observable<TAMainNavigationAction>) {
        viewModel.navigationAction
            .asDriver(onErrorRecover: { _ in fatalError("Unxecpected error in the main navigation action") })
            .drive(onNext: { navAction in
                switch navAction {
                case .present(let screen):
                    self.present(screen: screen)
                }
            })
            .disposed(by: self.disposeBag)
    }
    
}

// MARK: - View controllers presentating

private extension TAMainViewController {

    func present(screen: TAMainNavigationScreen) {
        switch screen {
        case .home:
            self.remove(child: onboardingViewController)
            guard homeViewController == nil else {
                return
            }
            homeViewController = mainFactory.makeHomeViewController()
            add(child: homeViewController!)
        case .onboarding:
            guard onboardingViewController == nil else {
                return
            }
            onboardingViewController = mainFactory.makeOnboardingViewController()
            add(child: onboardingViewController!)
        }
    }
    
}
