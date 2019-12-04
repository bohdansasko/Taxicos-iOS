//
//  TATaxiCell.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 12/4/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TATaxiOptionCell: TABaseTableViewCell {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var item: TATaxiOptionModel! {
        didSet {
            iconImageView.image = item.providerType.icon
            titleLabel.text = item.title
            priceLabel.text = item.formattedPrice
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

private extension TATaxiOptionCell {
    
    func setupLayout() {
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints{
            $0.left.equalToSuperview().offset(25)
            $0.centerY.equalToSuperview()
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.left.equalTo(iconImageView.snp.right).offset(12)
            $0.bottom.equalToSuperview().inset(18)
        }
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints{
            $0.right.equalToSuperview().inset(25)
            $0.centerY.equalToSuperview()
        }
        
        addSubview(separatorLineView)
        separatorLineView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
}

// MARK: - TAThemeable

extension TATaxiOptionCell: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor      = theme.colors.menuItemBackgroundColor

        titleLabel.font      = theme.colors.menuItemFont
        titleLabel.textColor = theme.colors.menuItemTextColor
        
        priceLabel.font      = theme.colors.menuItemFont
        priceLabel.textColor = theme.colors.menuItemTextColor
    }

}
