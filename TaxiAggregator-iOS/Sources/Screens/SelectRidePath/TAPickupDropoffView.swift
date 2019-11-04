//
//  TAPickupDropoffView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAPickupDropoffView: TABaseView {
    
    // MARK: - Pickup properties
    
    fileprivate let pickupIconView: UIImageView = {
        return makeIconView(image: #imageLiteral(resourceName: "icPickup"))
    }()

    fileprivate let pickupTF: UITextField = {
        return makeTextField(placeholder: "Enter location")
    }()
    
    // MARK: - Dropoff properties
    
    fileprivate let dropoffIconView: UIImageView = {
        return makeIconView(image: #imageLiteral(resourceName: "icDropoff"))
    }()
    
    fileprivate let dropoffTF: UITextField = {
        return makeTextField(placeholder: "Where to?")
    }()
    
    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
}

// MARK: - Setup

private extension TAPickupDropoffView {
    
    func setupUI() {
        backgroundColor = .white
        
        pickupTF.setContentHuggingPriority(.init(249), for: .horizontal)
        dropoffTF.setContentHuggingPriority(.init(249), for: .horizontal)
        
        let pickupSV = UIStackView(arrangedSubviews: [pickupIconView, pickupTF])
        pickupSV.distribution = .fill
        pickupSV.axis = .horizontal
        pickupSV.spacing = 12
        
        let dropoffSV = UIStackView(arrangedSubviews: [dropoffIconView, dropoffTF])
        dropoffSV.distribution = .fill
        dropoffSV.axis = .horizontal
        dropoffSV.spacing = 12
        
        let combinedSV = UIStackView(arrangedSubviews: [pickupSV, dropoffSV])
        combinedSV.axis = .vertical
        combinedSV.distribution = .fill
        combinedSV.spacing = 8
        addSubview(combinedSV)
        
        combinedSV.snp.makeConstraints {
            $0.left.equalToSuperview().inset(50)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
}

// MARK: - Make

private extension TAPickupDropoffView {

    static func makeTextField(placeholder: String?) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .left
        tf.font = UIFont(name: "Rubik-Regular", size: 14)
        tf.placeholder = placeholder
        return tf
    }
    
    static func makeIconView(image: UIImage?) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }

}
