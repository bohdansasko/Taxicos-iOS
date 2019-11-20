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

    fileprivate let pickupTF: TATextField = {
        return TAUIFactory.makeTextField(placeholder: "MAP_ENTER_LOCATION".localized, tintColor: #colorLiteral(red: 0.04705882353, green: 0.1960784314, blue: 0.7254901961, alpha: 1))
    }()
    
    // MARK: - Dropoff properties
    
    fileprivate let dropoffIconView: UIImageView = {
        return makeIconView(image: #imageLiteral(resourceName: "icDropoff"))
    }()
    
    fileprivate let dropoffTF: TATextField = {
        return TAUIFactory.makeTextField(placeholder: "MAP_WHERE_TO".localized, tintColor: #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1))
    }()

    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

}

// MARK: - 

extension TAPickupDropoffView {

    func pickupTextField() -> UITextField {
        return pickupTF.textField
    }
    
    func dropoffTextField() -> UITextField {
        return dropoffTF.textField
    }
    
}

// MARK: - Setup

private extension TAPickupDropoffView {
    
    func setupLayout() {
        backgroundColor = .white
        
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        
        pickupIconView.setContentHuggingPriority(.init(251), for: .horizontal)
        dropoffIconView.setContentHuggingPriority(.init(251), for: .horizontal)

        let pickupSV = UIStackView(arrangedSubviews: [pickupIconView, pickupTF])
        pickupSV.axis = .horizontal
        pickupSV.distribution = .fill
        pickupSV.spacing = 12

        let dropoffSV = UIStackView(arrangedSubviews: [dropoffIconView, dropoffTF])
        dropoffSV.translatesAutoresizingMaskIntoConstraints = false
        dropoffSV.axis = .horizontal
        dropoffSV.distribution = .fill
        dropoffSV.spacing = 12

        let fromToSV = UIStackView(arrangedSubviews: [pickupSV, dropoffSV])
        fromToSV.translatesAutoresizingMaskIntoConstraints = false
        fromToSV.axis = .vertical
        fromToSV.distribution = .fill
        fromToSV.spacing = 8
        
        let allSV = UIStackView(arrangedSubviews: [fromToSV])
        allSV.axis = .horizontal
        allSV.distribution = .fill
        allSV.alignment = .top
        allSV.spacing = 15
        addSubview(allSV)
        
        pickupTF.snp.makeConstraints { $0.height.equalTo(40) }
        dropoffTF.snp.makeConstraints { $0.height.equalTo(40) }
        
        allSV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(28)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
}

// MARK: - Make

private extension TAPickupDropoffView {
    
    static func makeIconView(image: UIImage?) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }

}
