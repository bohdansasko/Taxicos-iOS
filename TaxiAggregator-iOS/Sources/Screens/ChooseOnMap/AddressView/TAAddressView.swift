//
//  TAAddressView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 04.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift

final class TAAddressView: TABaseView {
  
    // MARK: - UI
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .medium, fontSize: 14)
        label.text = "TAXIS_CONFIRM_DESTINATION".localized
        label.textColor = #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
        return label
    }()
    
    fileprivate let locationIconView: UIImageView = {
        return makeIconView(image: #imageLiteral(resourceName: "icDropoff"))
    }()

    fileprivate let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .medium, fontSize: 18)
        label.text = "TAXIS_DETERMINING_ADDRESS".localized
        label.textColor = #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    let confirmButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.3137254902, blue: 0.6196078431, alpha: 1)
        b.setTitle("TAXIS_CONFIRM".localized, for: .normal)
        b.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        b.titleLabel!.font = UIFont.avenir(weight: .medium, fontSize: 16)
        b.layer.cornerRadius = 8
        return b
    }()

    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }
    
}

// MARK: - Setup

private extension TAAddressView {
    
    func setupLayout() {
        backgroundColor = .white
        
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        
        let offsetFromLeftRight = 25
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.left.equalToSuperview().offset(offsetFromLeftRight)
            $0.right.equalToSuperview().inset(offsetFromLeftRight)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(titleLabel)
            $0.height.equalTo(2)
        }
        
        locationIconView.setContentHuggingPriority(.init(251), for: .horizontal)

        let addressSV = UIStackView(arrangedSubviews: [locationIconView, addressLabel])
        addressSV.axis = .horizontal
        addressSV.distribution = .fill
        addressSV.alignment = .center
        addressSV.spacing = 20
        addSubview(addressSV)
        addressSV.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(16)
            $0.left.right.equalTo(titleLabel)
        }
        
        addSubview(confirmButton)
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(addressSV.snp.bottom).offset(16)
            $0.left.right.equalTo(titleLabel)
            $0.height.equalTo(46)
        }
    }
    
}

// MARK: - Set

extension TAAddressView {
    
    func set(address: TAAddressModel) {
        addressLabel.text = address.shortAddress ?? address.fullAddress
    }

    func set(addressType: TAActiveAddressTyping) {
        switch addressType {
        case .from:
            titleLabel.text = "TAXIS_CONFIRM_PICKUP".localized
        case .to:
            titleLabel.text = "TAXIS_CONFIRM_DESTINATION".localized
        }
    }
    
}

// MARK: - Makers

private extension TAAddressView {
    
    static func makeIconView(image: UIImage?) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }

}
