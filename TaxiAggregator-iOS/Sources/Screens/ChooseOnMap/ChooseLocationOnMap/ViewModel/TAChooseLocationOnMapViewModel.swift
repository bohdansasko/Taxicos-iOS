//
//  TAChooseLocationOnMapViewModel.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import RxCocoa
import RxRelay

final class TAChooseLocationOnMapViewModel {
    
    // MARK: - Internal properties
    
    private let _locationRepository: TALocationRepository
    
    // MARK: - Lifecycle
    
    init(locationRepository: TALocationRepository) {
        _locationRepository = locationRepository
    }
    
}

// MARK: - User interaction

extension TAChooseLocationOnMapViewModel {
    
    @objc func actConfirmLocation(_ sender: Any) {
        // 
    }

}

// MARK: - API

extension TAChooseLocationOnMapViewModel {

}
