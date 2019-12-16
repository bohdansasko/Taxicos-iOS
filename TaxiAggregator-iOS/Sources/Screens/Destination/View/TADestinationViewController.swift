//
//  TADestinationViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TADestinationViewController: TABaseViewController, TARootView {
    typealias RootViewType = TADestinationRootView
    
    // MARK: - Internal vars
    
    private let _viewModel: TADestinationViewModel
    private let _factory: TADestinationFactory
    
    // MARK: - Lifecycle
    
    init(viewModel: TADestinationViewModel, factory: TADestinationFactory) {
        _viewModel = viewModel
        _factory = factory
        
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupNavigationSubscription()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "SET_DESTINATION".localized
        navigationItem.backBarButtonItem?.title = " "
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }
    
}

// MARK: - Setup

private extension TADestinationViewController {
    
    func setupNavigationBar() {
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.backgroundColor = .white
    }
    
    func setupNavigationSubscription() {
        _viewModel.navigationAction
            .subscribe(onNext: { [weak self] action in
                switch action {
                case .present(let screen):
                    self?.present(screen: screen)
                }
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: -

private extension TADestinationViewController {

    func present(screen: TADestinationNavigationScreen) {
        switch screen {
        case .showTaxisOptions(let fromAddress, let toAddress):
            let vc = _factory.makeTaxisOptionsViewController(from: fromAddress, to: toAddress)
            push(viewController: vc)
        case .chooseLocationOnMap(let currentAddress, let addressType):
            let vc = _factory.makeChooseOnMapViewController(with: currentAddress, addressType: addressType)
            push(viewController: vc)
        }
    }
    
}
