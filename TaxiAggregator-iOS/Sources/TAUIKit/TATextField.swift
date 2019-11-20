//
//  TATextField.swift
//  TaxiAggregator-iOS
//
//  Created by Office Mac on 11/20/19.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TATextField: TABaseView {

    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textAlignment = .left
        tf.font = UIFont.rubik(weight: .regular, fontSize: 14)
        tf.textColor = #colorLiteral(red: 0.2039215686, green: 0.2196078431, blue: 0.337254902, alpha: 1)
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
}

private extension TATextField {
    
    func setupLayout() {
        backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        layer.cornerRadius = 4
        
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().offset(12)
            $0.right.equalToSuperview().inset(12)
        }
    }
    
}
