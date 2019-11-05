//
//  TALeftSideMenuCell.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TALeftSideMenuCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var item: TAMenuItem! {
        didSet {
            iconImageView.image = item.icon
            titleLabel.text = item.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        themeProvider.register(observer: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension TALeftSideMenuCell {
    
    func setupLayout() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        iconImageView.snp.makeConstraints{
            $0.left.equalToSuperview().offset(25)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.left.equalTo(iconImageView.snp.right).offset(12)
            $0.bottom.equalToSuperview().inset(18)
        }
    }
    
}

// MARK: - TAThemeable

extension TALeftSideMenuCell: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor      = theme.colors.menuItemBackgroundColor
        titleLabel.font      = theme.colors.menuItemFont
        titleLabel.textColor = theme.colors.menuItemTextColor
    }

}
