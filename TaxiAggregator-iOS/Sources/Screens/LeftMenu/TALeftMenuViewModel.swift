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
    let items    : [TAMenuItemType]
    let navigationAction = PublishSubject<TALeftMenuNavigationAction>()
    
    init() {
        self.items = TAMenuItemType.allCases
    }
    
}

// MARK: - Getters

extension TALeftMenuViewModel {

    func item(for indexPath: IndexPath) -> TAMenuItemType {
        return items[indexPath.row]
    }

}

// MARK: - User interactions

extension TALeftMenuViewModel {
    
    @objc func actSavedLocations(_ sender: Any) {
        navigationAction.onNext(.present(screen: .savedAddresses))
    }
    
    @objc func actShareApp(_ sender: Any) {
        navigationAction.onNext(.present(screen: .shareApp))
    }
    
    @objc func actFeedback(_ sender: Any) {
        navigationAction.onNext(.present(screen: .feedback))
    }
    
    @objc func actRateApp(_ sender: Any) {
        navigationAction.onNext(.present(screen: .rateApp))
    }
    
}
