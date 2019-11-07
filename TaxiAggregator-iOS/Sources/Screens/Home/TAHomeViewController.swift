//
//  TAHomeViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAHomeViewController: TABaseViewController {
    let viewModel: TAHomeViewModel
    let homeFactory: TAHomeFactory
    
    init(viewModel: TAHomeViewModel, homeFactory: TAHomeFactory) {
        self.viewModel = viewModel
        self.homeFactory = homeFactory
        super.init()
    }

    override func loadView() {
        view = TAHomeRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addMapViewController()
        subscribe(to: viewModel.navigationAction)
    }
    
}

private extension TAHomeViewController {
    
    func subscribe(to navigationAction: PublishSubject<TAHomeNavigationAction>) {
        navigationAction
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                switch action {
                case .present(let screen):
                    switch screen {
                    case .leftMenu:
                        let leftMenu = self.homeFactory.makeLeftMenuNavigationController()
                        self.present(leftMenu, animated: true, completion: nil)
                    }
                }
            }).disposed(by: disposeBag)
    }
    
}

private extension TAHomeViewController {
    
    func addMapViewController() {
        let mapViewController = homeFactory.makeMapViewController()
        add(child: mapViewController, to: (view as! TAHomeRootView).mapContainerView)
    }
    
}
