//
//  TALeftMenuViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 02.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import Foundation
import RxSwift

protocol TALeftMenuResponsder {
    func goToNextScreen(screen: TALeftMenuNavigationScreen)
}

final class TALeftMenuViewModel {
    private let _items: [TAMenuItemType]
    private let _menuResponder: TALeftMenuResponsder
    private let _shouldDimissMenu = PublishSubject<Bool>()
    
    var isMenuHidden: Observable<Bool> {
        return _shouldDimissMenu.asObservable()
    }
    
    init(menuResponder: TALeftMenuResponsder) {
        _items         = TAMenuItemType.allCases
        _menuResponder = menuResponder
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
        _menuResponder.goToNextScreen(screen: .savedAddresses)
        _shouldDimissMenu.onNext(true)
    }
    
    @objc func actShareApp(_ sender: Any) {
        _menuResponder.goToNextScreen(screen: .shareApp)
    }
    
    @objc func actFeedback(_ sender: Any) {
        _menuResponder.goToNextScreen(screen: .feedback)
    }
    
    @objc func actRateApp(_ sender: Any) {
        _menuResponder.goToNextScreen(screen: .rateApp)
    }
    
}
