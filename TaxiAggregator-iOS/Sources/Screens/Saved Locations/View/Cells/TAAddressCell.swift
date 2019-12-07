//
//  TAAddressCell.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/12/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TAAddressCell: TABaseTableViewCell {
    
    // MARK: - UI
    
    private let locationIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "icDropoff")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .regular, fontSize: 16)
        label.textColor =  #colorLiteral(red: 0.2078431373, green: 0.231372549, blue: 0.3137254902, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .regular, fontSize: 13)
        label.textColor = #colorLiteral(red: 0.2078431373, green: 0.231372549, blue: 0.3137254902, alpha: 0.5)
        label.textAlignment = .left
        return label
    }()
 
    private let heartButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.setImage(#imageLiteral(resourceName: "icEmptyHeart"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "icBlueHeart"), for: .selected)
        button.isSelected = true
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupLayout()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = highlighted ? #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1) : .clear
    }
    
}

// MARK: - Setup

private extension TAAddressCell {
    
    func setupLayout() {
        backgroundColor = .clear
        
        let titlesSV = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        titlesSV.alignment = .leading
        titlesSV.distribution = .fill
        titlesSV.spacing = 2
        titlesSV.axis = .vertical
        
        let contentSV = UIStackView(arrangedSubviews: [locationIconView, titlesSV, heartButton])
        contentSV.axis = .horizontal
        contentSV.alignment = .top
        contentSV.distribution = .fill
        contentSV.spacing = 16
        addSubview(contentSV)
        
        contentSV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().inset(36)
            $0.center.equalToSuperview()
        }
        
        locationIconView.snp.makeConstraints {
            $0.centerY.equalTo(heartButton).inset(1)
            $0.centerY.equalTo(titleLabel).offset(1)
        }
        
        addSubview(separatorLineView)
        separatorLineView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().inset(36)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
}

// MARK: - Set

extension TAAddressCell {
    
    func set(addressModel: TAAddressModel) {
        locationIconView.image = addressModel.icon
        titleLabel.text = addressModel.shortAddress
        subtitleLabel.text = addressModel.fullAddress
        heartButton.isHidden = !addressModel.isFavVisible
    }
    
}
