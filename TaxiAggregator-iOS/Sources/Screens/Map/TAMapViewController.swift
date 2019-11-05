//
//  TAMapViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SideMenu
import RxSwift

final class TAMapViewController: TABaseViewController {
    
    // MARK: - Internal variables
    
    let viewModel: TAMapViewModel
    let launchViewController: TALaunchViewController
    let makeLeftSideMenuViewController: () -> SideMenuNavigationController
    let makeOnboardingViewController: () -> TAOnboardingViewController
    
    // MARK: - View lifecycle
    
    init(viewModel: TAMapViewModel,
         leftSideMenuFactory: @escaping () -> SideMenuNavigationController,
         launchViewController: TALaunchViewController,
         onboardingFactory: @escaping () -> TAOnboardingViewController) {
        self.viewModel                    = viewModel
        self.makeLeftSideMenuViewController = leftSideMenuFactory
        self.launchViewController         = launchViewController
        self.makeOnboardingViewController = onboardingFactory
        super.init()
    }
    
    override func loadView() {
        view = TAMapRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe(to: viewModel.navigationAction)
    }
    
}

private extension TAMapViewController {
    
    func subscribe(to navigationAction: PublishSubject<TAMapNavigationAction>) {
        navigationAction
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                switch action {
                case .present(let screen):
                    switch screen {
                    case .leftMenu:
                        let leftMenu = self.makeLeftSideMenuViewController()
                        self.present(leftMenu, animated: true, completion: nil)
                    }
                }
            }).disposed(by: disposeBag)
    }
    
}
