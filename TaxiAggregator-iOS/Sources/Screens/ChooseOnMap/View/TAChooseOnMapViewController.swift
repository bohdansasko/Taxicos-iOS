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
        
        add(child: _chooseOnMapViewController, to: rootView.mapContainerView)
        subscribe(to: _viewModel.navigationAction)
    }
    
}

private extension TAChooseOnMapViewController {
    
    func subscribe(to navigationAction: Observable<TAChooseOnMapNavigationAction>) {
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
    
    func present(screen: TAChooseOnMapNavigationScreen) {
        switch screen {
        case .destination(let address):
            self.close()
        }
    }
    
}
