//
//  TALeftMenuViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TALeftMenuViewController: TABaseViewController {
    let viewModel: TALeftMenuViewModel
    
    init(viewModel: TALeftMenuViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = TALeftMenuRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe(to: viewModel.navigationAction)
    }
    
}

// MARK: Subscriptions

extension TALeftMenuViewController {
    
    func subscribe(to navigationAction: PublishSubject<TALeftMenuNavigationAction>) {
        viewModel.navigationAction.subscribe(onNext: { navigationAction in
            switch navigationAction {
            case .present(let screen):
                switch screen {
                case .savedAddresses:
                    log.debug("savedAddresses")
                case .shareApp:
                    log.debug("shareApp")
                case .feedback:
                    log.debug("feedback")
                case .rateApp:
                    log.debug("rateApp")
                }
            }
        }).disposed(by: disposeBag)
    }
    
}
