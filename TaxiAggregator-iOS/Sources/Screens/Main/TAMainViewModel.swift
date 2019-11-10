//
//  TAMainViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

enum TAMainNavigationScreen {
    case home(userSession: TAUserSession)
    case onboarding
}

// MARK: - Equatable

extension TAMainNavigationScreen: Equatable {
    
    static func == (lhs: TAMainNavigationScreen, rhs: TAMainNavigationScreen) -> Bool {
        switch (lhs, rhs) {
        case (.onboarding, .onboarding):
            return true
        case let (.home(l), .home(r)):
            return l == r
        case (.onboarding, _),
             (.home, _):
            return false
        }
    }
    
}

typealias TAMainNavigationAction = TANavigationAction<TAMainNavigationScreen>

final class TAMainViewModel {
    private let _userSessionRepository: TAUserSessionRepository
    private var _userSession: TAUserSession!
    private let _navigationAction = PublishSubject<TAMainNavigationAction>()
    
    var navigationAction: Observable<TAMainNavigationAction> {
        return _navigationAction.asObservable()
    }
    
    
    init(userSessionRepository: TAUserSessionRepository) {
        _userSessionRepository = userSessionRepository
        
        loadUserSession()
    }
    
    func loadUserSession() {
        _userSessionRepository.readUserSession()
            .done(goToNextScreen(userSession:))
            .catch { error in
                let errorMessage = TAErrorMessage(title: "No title",
                                                  message: "Unknown error")
                log.debug(errorMessage)
            }
    }
    
    func goToNextScreen(userSession: TAUserSession?) {
        switch userSession {
        case .none:
            log.debug("user needs authorization")
        case .some(let userSession):
            _userSession = userSession
            if userSession.features.isUserSeenOnboarding {
                goToHomeScreen()
            } else {
                goToOnboardingScreen()
            }
        }
    }
    
    func goToOnboardingScreen() {
        _navigationAction.onNext(.present(screen: .onboarding))
    }
    
}

// MARK: - TAOnboardingResponder

extension TAMainViewModel: TAOnboardingResponder {
    
    func goToHomeScreen() {
        _userSession.features.setUserSeenOnboarding(isUserSeen: true)
        _navigationAction.onNext(.present(screen: .home(userSession: _userSession)))
    }
    
}
