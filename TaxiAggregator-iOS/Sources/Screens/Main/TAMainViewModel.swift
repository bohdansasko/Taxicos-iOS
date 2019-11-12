//
//  TAMainViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 07.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

protocol TAOpenLeftMenuResponder {
    func goToLeftMenu()
}

typealias TAMainNavigationAction = TANavigationAction<TAMainNavigationScreen>

final class TAMainViewModel {
    
    // MARK: - Properties
    
    private let _userSessionRepository: TAUserSessionRepository
    private var _userSession: TAUserSession!
    private let _navigationAction = PublishSubject<TAMainNavigationAction>()
    
    var navigationAction: Observable<TAMainNavigationAction> {
        return _navigationAction.asObservable()
    }
    
    // MARK: - Methods
    
    init(userSessionRepository: TAUserSessionRepository) {
        _userSessionRepository = userSessionRepository
        // ...
        fetchUserSession()
    }
    
}

// MARK: - Screen navigation

private extension TAMainViewModel {
    
    func fetchUserSession() {
        _userSessionRepository.readUserSession()
            .done(goToNextScreen(userSession:))
            .catch { error in
                let errorMessage = TAErrorMessage(title: "No title",
                                                  message: "Unknown error")
                log.debug(errorMessage)
            }
    }
    
}

// MARK: - Screen navigation

private extension TAMainViewModel {
    
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

// MARK: - TAOnboardingResponder

extension TAMainViewModel: TAOpenLeftMenuResponder {
    
    func goToLeftMenu() {
        _navigationAction.onNext(.present(screen: .leftMenu))
    }
    
}
