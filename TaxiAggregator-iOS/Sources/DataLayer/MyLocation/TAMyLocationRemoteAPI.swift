//
//  TAMyLocationRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/15/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import RxSwift
import MapKit

protocol TAMyLocationRemoteAPI {
    var myLocation: Observable<CLLocation> { get }
    
    func determineMyLocation()
}
