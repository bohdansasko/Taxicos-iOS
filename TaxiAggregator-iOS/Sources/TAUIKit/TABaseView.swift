//
//  TABaseView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

class TABaseView: UIView {
    
    let disposeBag = DisposeBag()

    let activityIndicator: UIActivityIndicatorView  = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable, message: "")
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
