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
    let kStartNumberPage  = 1
    let kNumberOfPages    = 3
    let currentPageNumber = BehaviorSubject<Int>(value: 1)
    let onboardingResponder: TAOnboardingResponder
    
    var isLastPage: Bool {
        guard let currentPN = try? currentPageNumber.value() else {
            return false
        }
        return currentPN == kNumberOfPages
    }
    
    init(onboardingResponder: TAOnboardingResponder) {
        self.onboardingResponder = onboardingResponder
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
        let currentPageIdx = try! currentPageNumber.value()
        moveTo(page: currentPageIdx + 1)
    }
    
    func moveToPrevPage() {
        let currentPageIdx = try! currentPageNumber.value()
        moveTo(page: currentPageIdx - 1)
    }
    
    func moveTo(page: Int) {
        var nextPageIdx = page
        
        if page > kNumberOfPages {
            nextPageIdx = kStartNumberPage
        } else if page < kStartNumberPage {
            nextPageIdx = kNumberOfPages
        }
        
        currentPageNumber.onNext(nextPageIdx)
    }
    
}
