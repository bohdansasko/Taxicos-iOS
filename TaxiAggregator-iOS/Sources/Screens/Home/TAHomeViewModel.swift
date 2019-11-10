//
//  TAHomeViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

typealias TAHomeNavigationAction = TANavigationAction<TAHomeNavigationScreen>

final class TAHomeViewModel {
    let navigationAction = PublishSubject<TAHomeNavigationAction>()
}

extension TAHomeViewModel {
    
    @objc func actMenuButton() {
        navigationAction.onNext(.present(screen: .leftMenu))
    }
    
}

// MARK: - TALeftMenuResponsder

extension TAHomeViewModel: TALeftMenuResponsder {
    
    func goToNextScreen(screen: TALeftMenuNavigationScreen) {
        navigationAction.onNext(.present(screen: .leftMenuScreen(screen)))
    }
    
}
