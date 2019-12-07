//
//  TAOnboardingViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

protocol TAOnboardingResponder {
    func goToHomeScreen()
}

final class TAOnboardingViewModel {
    
    // MARK: - Properties
    
            let kStartNumberPage   = 1
            let kNumberOfPages     = 3
    private let _currentPageNumber = BehaviorSubject<Int>(value: 1)
    fileprivate let onboardingResponder: TAOnboardingResponder
    
    // MARK: - Observable getters
    
    var currentPageNumber: Observable<Int> {
        return _currentPageNumber.asObservable()
    }
    
    // MARK: - Getters
    
    init(onboardingResponder: TAOnboardingResponder) {
        self.onboardingResponder = onboardingResponder
    }
    
}

// MARK: - Getters

extension TAOnboardingViewModel {
    
    var isLastPage: Bool {
        guard let currentPN = try? _currentPageNumber.value() else {
            return false
        }
        return currentPN == kNumberOfPages
    }
    
}

// MARK: - User interaction

extension TAOnboardingViewModel {
    
    @objc func actSkipButton() {
        log.info("skip")
        onboardingResponder.goToHomeScreen()
    }
    
    @objc func actNextButton() {
        moveToNextPage()
    }
    
    @objc func actDoneButton() {
        onboardingResponder.goToHomeScreen()
    }
    
}

// MARK: - Page navigation

extension TAOnboardingViewModel {

    func moveToNextPage() {
        let currentPageIdx = try! _currentPageNumber.value()
        moveTo(page: currentPageIdx + 1)
    }
    
    func moveToPrevPage() {
        let currentPageIdx = try! _currentPageNumber.value()
        moveTo(page: currentPageIdx - 1)
    }
    
    func moveTo(page: Int) {
        var nextPageIdx = page
        
        if page > kNumberOfPages {
            nextPageIdx = kStartNumberPage
        } else if page < kStartNumberPage {
            nextPageIdx = kNumberOfPages
        }
        
        _currentPageNumber.onNext(nextPageIdx)
    }
    
}
