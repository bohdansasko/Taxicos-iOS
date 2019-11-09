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
    let viewModel: TAMainViewModel
    let mainFactory: TAMainFactory
    
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

extension TAMainViewController {
    
    func subscribe(to navigation: BehaviorSubject<TAMainNavigationAction>) {
        viewModel.navigationAction
            .asDriver(onErrorJustReturn: .present(screen: .home))
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

extension TAMainViewController {

    func present(screen: TAMainNavigationScreen) {
        self.children.forEach{ self.remove(child: $0) }
        
        switch screen {
        case .home:
            let homeViewController = mainFactory.makeHomeViewController()
            add(child: homeViewController)
        case .onboarding:
            let onboardingViewController = mainFactory.makeOnboardingViewController()
            add(child: onboardingViewController)
        }
    }
    
}
