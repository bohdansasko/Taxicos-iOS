//
//  TAGoogleGeocodeRemoteAPI.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 08.12.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import PromiseKit
import GoogleMaps

final class TAGoogleGeocodeRemoteAPI {
    private let _geocoder = GMSGeocoder()
}

extension TAGoogleGeocodeRemoteAPI: TAGeocodeRemoteAPI {
    
    func reverseGeocodeCoordinate(with coordinate: CLLocationCoordinate2D) -> Promise<TAAddressModel> {
        return Promise { seal in
            _geocoder.reverseGeocodeCoordinate(coordinate, completionHandler: { response, error in
                guard error == nil else {
                    log.error(error!.localizedDescription)
                    seal.reject(error!)
                    return
                }

                guard let address = response?.firstResult(),
                      let lines = address.lines else {
                    return
                }

                let addressStr = lines.joined(separator: ", ")
                let addressModel = TAAddressModel(
                    icon: #imageLiteral(resourceName: "icDropoff"),
                    shortAddress: address.thoroughfare,
                    fullAddress: addressStr,
                    location: coordinate,
                    timestamp: Date().timeIntervalSince1970
                )
                seal.fulfill(addressModel)
            })
        }
    }
    
}
