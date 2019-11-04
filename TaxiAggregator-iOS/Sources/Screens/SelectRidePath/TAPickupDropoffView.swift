//
//  TAPickupDropoffNavigationBar.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAPickupDropoffNavigationBar: UINavigationBar {

    // MARK: - Menu button
    
    let menuButton: UIButton = {
        let menuIcon = #imageLiteral(resourceName: "icMenu").withRenderingMode(.alwaysOriginal)
        let menuButton = UIButton(type: .system)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.setImage(menuIcon, for: .normal)
        menuButton.contentMode = .scaleAspectFit
        return menuButton
    }()
    
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup

private extension TAPickupDropoffNavigationBar {
    
    func setupUI() {
        backgroundColor = .white
        
        menuButton.setContentHuggingPriority(.init(251), for: .horizontal)
        
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
        
        let allSV = UIStackView(arrangedSubviews: [menuButton, fromToSV])
        allSV.axis = .horizontal
        allSV.distribution = .fill
        allSV.alignment = .top
        allSV.spacing = 15
        addSubview(allSV)
        
        menuButton.snp.makeConstraints{ $0.centerY.equalTo(pickupIconView) }
        
        allSV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(18)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
}

// MARK: - Make

private extension TAPickupDropoffNavigationBar {

    static func makeTextField(placeholder: String?) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .left
        tf.font = UIFont.rubik(weight: .regular, fontSize: 14)
        tf.placeholder = placeholder
        return tf
    }
    
    static func makeIconView(image: UIImage?) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }

}
