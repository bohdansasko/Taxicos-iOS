//
//  TASearchDestinationView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 17.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASearchDestinationView: TABaseView {

    private let upperTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubik(weight: .regular, fontSize: 13)
        label.text = "DESTINATION_TIME_TO_FIND_CHEAPEST_CAB".localized
        label.textColor = #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenir(weight: .medium, fontSize: 22)
        label.text = "DESTINATION_WHERE_YOU_GONNA".localized
        label.textColor = #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
        return label
    }()
    
    private let searchButton: TATapableTextField = {
        let ttf = TATapableTextField()
        return ttf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }

}

private extension TASearchDestinationView {
   
    func setupLayout() {
        backgroundColor    = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowOpacity = 0.3
        
        addSubview(upperTitleLabel)
        upperTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(upperTitleLabel.snp.bottom).offset(4)
            $0.left.right.equalTo(upperTitleLabel)
        }
        
        addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(actSearchDestinationButton), for: .touchUpInside)
        searchButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(titleLabel)
            $0.height.equalTo(40)
        }
    }
    
    @objc func actSearchDestinationButton() {
        log.info("")
    }
    
}
