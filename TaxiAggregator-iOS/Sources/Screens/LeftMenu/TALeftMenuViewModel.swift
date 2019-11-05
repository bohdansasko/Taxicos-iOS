//
//  TALeftMenuViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation
import RxSwift

typealias TALeftMenuNavigationAction = TANavigationAction<TALeftMenuNavigationScreen>

final class TALeftMenuViewModel {
    let navigationAction = PublishSubject<TALeftMenuNavigationAction>()
    
}

// MARK: - User interactions

extension TALeftMenuViewModel {
    
    @objc func actSavedLocations(_ sender: Any) {
        navigationAction.onNext(.present(.savedAddresses))
    }
    
    @objc func actShareApp(_ sender: Any) {
        navigationAction.onNext(.present(.shareApp))
    }
    
    @objc func actFeedback(_ sender: Any) {
        navigationAction.onNext(.present(.feedback))
    }
    
    @objc func actRateApp(_ sender: Any) {
        navigationAction.onNext(.present(.rateApp))
    }
    
}
