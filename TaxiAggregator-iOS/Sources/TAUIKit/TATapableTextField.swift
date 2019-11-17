//
//  TATapableTextField.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 17.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TATapableTextField: UIControl {
    var highlightedColor: UIColor {
        return UIColor(rgb: 250)
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightedColor : .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        if bounds.contains(touchLocation) {
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }

}

private extension TATapableTextField {
    
    func setupLayout() {
        backgroundColor = .white
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.cornerRadius = 8

        let iconView = UIImageView(image: #imageLiteral(resourceName: "icDropoff"))
        iconView.contentMode = .scaleAspectFit
        iconView.setContentHuggingPriority(.init(251), for: .horizontal)
        
        let label = UILabel()
        label.font = UIFont.rubik(weight: .regular, fontSize: 16)
        label.text = "Search destination"
        label.textColor = #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1)
        label.textAlignment = .left
        
        let componentsSV = UIStackView(arrangedSubviews: [iconView, label])
        componentsSV.axis = .horizontal
        componentsSV.alignment = .leading
        componentsSV.spacing = 12
        componentsSV.isUserInteractionEnabled = false
        addSubview(componentsSV)
        
        iconView.snp.makeConstraints {
            $0.centerY.equalTo(label)
        }
        
        componentsSV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(12)
            $0.right.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }
    
}
