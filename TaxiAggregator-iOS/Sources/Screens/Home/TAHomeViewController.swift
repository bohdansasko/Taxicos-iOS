//
//  TAHomeViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import StoreKit

final class TAHomeViewController: TABaseViewController {
    fileprivate let viewModel: TAHomeViewModel
    fileprivate let homeFactory: TAHomeFactory

    fileprivate var leftMenuViewController: UINavigationController?

    init(viewModel: TAHomeViewModel, homeFactory: TAHomeFactory) {
        self.viewModel = viewModel
        self.homeFactory = homeFactory
        super.init()
    }

    override func loadView() {
        view = TAHomeRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController!.delegate = self

        addMapViewController()
        subscribe(to: viewModel.navigationAction)
    }
    
}

// MARK: - Subscriptions

private extension TAHomeViewController {
    
    func subscribe(to navigationAction: Observable<TAHomeNavigationAction>) {
        navigationAction
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                switch action {
                case .present(let screen):
                    self.present(screen: screen)
                }
            }).disposed(by: disposeBag)
    }
    
}

// MARK: - View controllers presentation

private extension TAHomeViewController {
    
    func present(screen: TAHomeNavigationScreen) {
        switch screen {
        case .leftMenu:
            self.presentLeftMenuViewController()
        case .leftMenuScreen(let screen):
            self.presentViewController(menu: screen)
        }
    }
    
    func addMapViewController() {
        let mapViewController = homeFactory.makeMapViewController()
        add(child: mapViewController, to: (view as! TAHomeRootView).mapContainerView)
    }
    
    func presentLeftMenuViewController() {
//        guard leftMenuViewController == nil else {
//            return
//        }
//        leftMenuViewController = homeFactory.makeLeftMenuNavigationController()
//        self.present(leftMenuViewController!, animated: true, completion: nil)
    }
    
    func presentViewController(menu screen: TALeftMenuNavigationScreen) {
//        switch screen {
//        case .savedAddresses:
//            break
////            guard let navController = navigationController else {
////                assertionFailure("required")
////                return
////            }
////            let vc = homeFactory.makeSavedAddressesViewController()
////            navController.pushViewController(vc, animated: true)
//        case .shareApp:
//            break
//        case .feedback:
//            break
//        case .rateApp:
//            SKStoreReviewController.requestReview()
//        }
    }
    
}

// MARK: - Navigation bar visibility

private extension TAHomeViewController {
    
    func hideOrShowNavigationBarIfNeeded(for screen: TALeftMenuNavigationScreen, animated: Bool) {
        if screen.hidesNavigationBar {
            hideNavigationBar(animated: animated)
        } else {
            showNavigationBar(animated: animated)
        }
    }
    
    func homeScreen(assosiatedWith vc: UIViewController) -> TALeftMenuNavigationScreen? {
        switch vc {
        case is TASavedAddressesViewController:
            return .savedAddresses
        case is TAMapViewController:
            return .savedAddresses
        default:
            return nil
        }
    }

    func hideNavigationBar(animated: Bool) {
        navigationController!.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(animated: Bool) {
        if navigationController!.isNavigationBarHidden {
            navigationController!.setNavigationBarHidden(false, animated: animated)
        }
    }
    
}

// MARK: - UINavigationControllerDelegate

extension TAHomeViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let screen = homeScreen(assosiatedWith: viewController) else {
            if viewController is TAHomeViewController {
                hideNavigationBar(animated: false)
            }
            return
        }
        hideOrShowNavigationBarIfNeeded(for: screen, animated: animated)
    }
    
}
