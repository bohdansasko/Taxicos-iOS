//
//  TAChooseOnMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/9/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAChooseOnMapViewController: TABaseViewController, TARootView {
    typealias RootViewType = TAChooseOnMapRootView
    
    // MARK: - Properties
    
    private let _viewModel: TAChooseOnMapViewModel
    
    // MARK: - UI
    
    private let _chooseOnMapViewController: TAChooseLocationOnMapViewController
    
    // MARK: - Lifecycle
    
    init(viewModel: TAChooseOnMapViewModel, chooseOnMapViewController: TAChooseLocationOnMapViewController) {
        _viewModel = viewModel
        _chooseOnMapViewController = chooseOnMapViewController
        
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: _viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitle()
        setupSubscription(to: _viewModel.navigationAction)
        add(child: _chooseOnMapViewController, to: rootView.mapContainerView)
    }
    
}


// MARK: - Setup

private extension TAChooseOnMapViewController {
 
    func setupNavigationTitle() {
        switch _viewModel.addressType {
        case .from:
            navigationItem.title = "CHOOSE_ON_MAP_PICKUP_TITLE".localized
        case .to:
            navigationItem.title = "CHOOSE_ON_MAP_DESTINATION_TITLE".localized
        }
    }
    
    func setupSubscription(to navigationAction: Observable<TAChooseOnMapNavigationAction>) {
        navigationAction
            .asDriver(onErrorRecover: { _ in fatalError("Unxecpected error in the choose on map navigation action") })
            .drive(onNext: { navAction in
                switch navAction {
                case .present(let screen):
                    self.present(screen: screen)
                }
            })
            .disposed(by: self.disposeBag)
    }
    
}

// MARK: - Present view controller

private extension TAChooseOnMapViewController {
    
    func present(screen: TAChooseOnMapNavigationScreen) {
        switch screen {
        case .destination(_):
            self.close()
        }
    }
    
}
