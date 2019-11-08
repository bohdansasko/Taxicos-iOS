//
//  TAOnboardingViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift

final class TAOnboardingViewModel {
    let kStartNumberPage  = 1
    let kNumberOfPages    = 3
    
    let currentPageNumber = BehaviorSubject<Int>(value: 1)
    
    var isLastPage: Bool {
        guard let currentPN = try? currentPageNumber.value() else {
            return false
        }
        return currentPN == kNumberOfPages
    }
    
}

// MARK: - User interaction

extension TAOnboardingViewModel {
    
    @objc func actSkipButton() {
        log.info("skip")
    }
    
    @objc func actNextButton() {
        moveToNextPage()
    }
    
    @objc func actDoneButton() {
        log.info("done")
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
