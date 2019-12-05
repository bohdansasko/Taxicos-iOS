//
//  TATaxisOptionsViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TATaxisOptionsViewController: TABaseViewController, TARootView {
    typealias RootViewType = TATaxisOptionsRootView
    
    // MARK: - Properties
    
    private let viewModel: TATaxisOptionsViewModel
    
    // MARK: - View lifecycle
    
    init(viewModel: TATaxisOptionsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = RootViewType(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TAXIS_OPTIONS_TITLE".localized
        setupErrorMessageSubscription()
        viewModel.fetchTaxisOptions()
    }
    
}

// MARK: - Setup

private extension TATaxisOptionsViewController {
    
    func setupErrorMessageSubscription() {
        viewModel.errorMessage
            .subscribe(onNext: { [weak self] err in
                guard let self = self else { return }
                let message = err.localizedDescription
                let errorMessage = TAErrorMessage(title: self.navigationItem.title, message: message)
                self.handleError(errorMessage)
            }).disposed(by: disposeBag)
    }
    
}
