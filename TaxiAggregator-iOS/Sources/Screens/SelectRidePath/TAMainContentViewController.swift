//
//  TAMainContentViewController.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import SideMenu

final class TAMainContentViewController: TABaseViewController {
    let viewModel: TAMainContentViewModel
    let launchViewController: TALaunchViewController
    let makeLeftSideMenu: () -> SideMenuNavigationController
    let makeOnboardingViewController: () -> TAOnboardingViewController
    
    init(viewModel: TAMainContentViewModel,
         leftSideMenuFactory: @escaping () -> SideMenuNavigationController,
         launchViewController: TALaunchViewController,
         onboardingFactory: @escaping () -> TAOnboardingViewController) {
        self.viewModel                    = viewModel
        self.makeLeftSideMenu             = leftSideMenuFactory
        self.launchViewController         = launchViewController
        self.makeOnboardingViewController = onboardingFactory
        super.init()
    }
    
    override func loadView() {
        view = TAMainContentRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        clearNavigationBar()
        
        let menuIcon = #imageLiteral(resourceName: "icMenu").withRenderingMode(.alwaysOriginal)
        let menuButton = UIBarButtonItem(image: menuIcon, style: .done, target: self, action: #selector(actMenuButton))
        navigationItem.leftBarButtonItem = menuButton
    }
    
    @objc func actMenuButton(sender: Any) {
        let leftMenu = makeLeftSideMenu()
        present(leftMenu, animated: true, completion: nil)
    }

}
