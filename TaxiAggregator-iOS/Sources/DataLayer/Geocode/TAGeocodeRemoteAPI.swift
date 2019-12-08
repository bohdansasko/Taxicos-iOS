//
//  TAGeocodeRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 08.12.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit
import GoogleMaps

protocol TAGeocodeRemoteAPI {
    func reverseGeocodeCoordinate(with coordinate: CLLocationCoordinate2D) -> Promise<TAAddressModel>
}

