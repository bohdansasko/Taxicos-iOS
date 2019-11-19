//
//  TAHomeViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

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
        let destinationView = homeFactory.makeSearchDestinationView()
        view = RootViewType(viewModel: viewModel, destinationView: destinationView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        addMapViewController()
        subscribe(to: viewModel.navigationAction)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "APP_NAME".localized
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }
}

// MARK: - Setup

private extension TAHomeViewController {
    
    func setupNavigationBar() {
        navigationController!.navigationBar.backItem?.title = " 2 "
        navigationItem.backBarButtonItem?.title = " 1 "
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rootView.menuButton)
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.backgroundColor = .white
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
        switch screen {
        case .setDestination(let addressModel):
            let destinationViewController = homeFactory.makeDestinationViewController(with: addressModel)
            navigationController!.pushViewController(destinationViewController, animated: true)
        }
    }
    
}
