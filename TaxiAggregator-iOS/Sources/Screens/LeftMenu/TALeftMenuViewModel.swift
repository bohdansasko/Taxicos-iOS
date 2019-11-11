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
    
    // MARK: - Properties
    
    private let _navigationAction = PublishSubject<TALeftMenuNavigationAction>()
    private let _items: [TAMenuItemType]
    private let _shouldDimissMenu = PublishSubject<Bool>()
    
    // MARK: - Getters
    
    var navigationAction: Observable<TALeftMenuNavigationAction> {
        return _navigationAction.asObservable()
    }
    
    // MARK: - Methods
    
    init() {
        _items = TAMenuItemType.allCases
    }
    
}

// MARK: - Getters

extension TALeftMenuViewModel {

    func item(for indexPath: IndexPath) -> TAMenuItemType {
        return _items[indexPath.row]
    }

    var numberOfItems: Int {
        return _items.count
    }
    
}

// MARK: - User interactions

extension TALeftMenuViewModel {
    
    @objc func actSavedLocations(_ sender: Any) {
        _navigationAction.onNext(.present(screen: .savedAddresses))
    }
    
    @objc func actShareApp(_ sender: Any) {
        _navigationAction.onNext(.present(screen: .shareApp))
    }
    
    @objc func actFeedback(_ sender: Any) {
        _navigationAction.onNext(.present(screen: .feedback))
    }
    
    @objc func actRateApp(_ sender: Any) {
        _navigationAction.onNext(.present(screen: .rateApp))
    }
    
}
