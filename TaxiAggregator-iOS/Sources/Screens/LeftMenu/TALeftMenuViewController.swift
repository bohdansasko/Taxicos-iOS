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

        subscribe(to: viewModel.isMenuHidden)
    }
    
}

// MARK: - Subscriptions

private extension TALeftMenuViewController {
    
    func subscribe(to isMenuHidden: Observable<Bool>) {
        isMenuHidden
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { isDismiss in
                if isDismiss {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
    
}
