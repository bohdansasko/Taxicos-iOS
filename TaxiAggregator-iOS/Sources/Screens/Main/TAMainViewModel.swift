//
//  TAMainViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

enum TAMainNavigationScreen {
    case home
    case onboarding
}

typealias TAMainNavigationAction = TANavigationAction<TAMainNavigationScreen>

final class TAMainViewModel {
    let navigationAction = BehaviorSubject<TAMainNavigationAction>(value: .present(screen: .onboarding))
}

// MARK: - TAOnboardingResponder

extension TAMainViewModel: TAOnboardingResponder {
    
    func goToHomeScreen() {
        navigationAction.onNext(.present(screen: .home))
    }
    
}
