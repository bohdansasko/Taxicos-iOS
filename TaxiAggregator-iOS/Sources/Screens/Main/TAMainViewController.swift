//
//  TAMainViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import StoreKit

final class TAMainViewController: TABaseViewController {
    private let viewModel: TAMainViewModel
    private let mainFactory: TAMainFactory
    
    private var homeViewController      : UIViewController?
    private var onboardingViewController: TABaseViewController?
    private var leftMenuViewController  : UINavigationController?

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

        self.navigationController?.delegate = self
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
            onboardingViewController = nil
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
        case .leftMenu:
            guard leftMenuViewController == nil else {
                self.present(leftMenuViewController!, animated: true, completion: nil)
                return
            }
            leftMenuViewController = mainFactory.makeLeftMenuNavigationController()
            self.present(leftMenuViewController!, animated: true, completion: nil)
        }
    }
    
}

extension TAMainViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is TAMainViewController {
            navigationController.setNavigationBarHidden(true, animated: false)
        } else if navigationController.isNavigationBarHidden {
            navigationController.setNavigationBarHidden(false, animated: false)
        }
    }
    
}
