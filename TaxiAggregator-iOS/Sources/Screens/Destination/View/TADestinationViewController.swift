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
    
    // MARK: - Properties
    
    private let _viewModel: TADestinationViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: TADestinationViewModel) {
        _viewModel = viewModel
        
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
    
}

// MARK: - Setup

private extension TADestinationViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "SET_DESTINATION".localized
        
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
            log.debug(fromAddress, toAddress)
        case .chooseLocationOnMap:
            log.debug("chooseLocationOnMap")
        }
    }
    
}