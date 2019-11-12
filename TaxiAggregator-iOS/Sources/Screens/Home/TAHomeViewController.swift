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

final class TAHomeViewController: TABaseViewController, TARootView {
    typealias RootViewType = TAHomeRootView

    // MARK: - Properties

    fileprivate let viewModel: TAHomeViewModel
    fileprivate let homeFactory: TAHomeFactory

    fileprivate var leftMenuViewController: UINavigationController?

    // MARK: - View lifecycle

    init(viewModel: TAHomeViewModel, homeFactory: TAHomeFactory) {
        self.viewModel = viewModel
        self.homeFactory = homeFactory
        super.init()
    }

    override func loadView() {
        view = RootViewType(viewModel: viewModel)
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

    func addMapViewController() {
        let mapViewController = homeFactory.makeMapViewController()
        add(child: mapViewController, to: rootView.mapContainerView)
    }
    
    func present(screen: TAHomeNavigationScreen) {
        // do nothing
    }
    
}

// MARK: - UINavigationControllerDelegate

extension TAHomeViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is TAHomeViewController {
            hideNavigationBar(animated: animated)
            return
        }
        showNavigationBar(animated: animated)
    }
    
}
