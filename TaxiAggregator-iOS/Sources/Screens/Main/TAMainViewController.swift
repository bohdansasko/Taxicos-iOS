//
//  TAMainViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAMainViewController: TABaseViewController {
    let viewModel: TAMainViewModel
    let mainFactory: TAMainFactory
    
    init(viewModel: TAMainViewModel, mainFactory: TAMainFactory) {
        self.viewModel = viewModel
        self.mainFactory = mainFactory
        super.init()
    }

    override func loadView() {
        view = TAMainRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = mainFactory.makeHomeViewController()
        add(child: homeViewController)        
    }

}
