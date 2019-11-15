//
//  TASetLocationOnMapCell.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 14.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASetLocationOnMapCell: TABaseTableViewCell {
    
    // MARK: - UI
    
    private let locationIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = #imageLiteral(resourceName: "icVector")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .regular, fontSize: 16)
        label.textColor =  #colorLiteral(red: 0.2078431373, green: 0.231372549, blue: 0.3137254902, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
}

// MARK: - Setup

private extension TASetLocationOnMapCell {
    
    func setupLayout() {
        backgroundColor = .clear
        
        titleLabel.setContentHuggingPriority(.init(249), for: .horizontal)
        
        let contentSV = UIStackView(arrangedSubviews: [locationIconView, titleLabel])
        contentSV.axis = .horizontal
        contentSV.alignment = .leading
        contentSV.distribution = .fill
        contentSV.spacing = 19
        addSubview(contentSV)
        
        contentSV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
//        locationIconView.snp.makeConstraints {
//            $0.centerY.equalTo(titleLabel).offset(1)
//        }
    }
    
}

// MARK: - Set

extension TASetLocationOnMapCell {
    
    func set(title: String?) {
        titleLabel.text = title
    }
    
}
