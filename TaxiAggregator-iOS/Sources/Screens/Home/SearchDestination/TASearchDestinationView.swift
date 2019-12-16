//
//  TASearchDestinationView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 17.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit

final class TASearchDestinationView: TABaseView {

    // MARK: - Properties
    
    private let viewModel: TASearchDestinationViewModel
    
    // MARK: - UI
    
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
    
    private let addressesTable: UITableView = {
        let tv = TAUIFactory.makeTableView()
        tv.register(class: TAAddressCell.self)
        tv.isScrollEnabled = false
        return tv
    }()
    
    // MARK: - View lifecycle
    
    init(frame: CGRect = .zero, viewModel: TASearchDestinationViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        subscribeToViewModel()
        
        viewModel.fetchHistory()
    }

}

// MARK: - Setup

private extension TASearchDestinationView {
   
    func setupLayout() {
        backgroundColor     = .white
        
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0, height: -2)
        layer.shadowOpacity = 0.2
        
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
        searchButton.addTarget(
            viewModel,
            action: #selector(viewModel.actSearchDestinationButton)
        )
        searchButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(titleLabel)
            $0.height.equalTo(40)
        }
        
        addressesTable.dataSource = self
        addressesTable.delegate = self
        
        addSubview(addressesTable)
        addressesTable.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - View model subscriptions

private extension TASearchDestinationView {
    
    func subscribeToViewModel() {
        viewModel.items
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { [weak self] items in
                guard let self = self else { return }
                self.addressesTable.reloadData()
            })
            .disposed(by: self.disposeBag)
    }
    
}

// MARK: - UITableViewDataSource

extension TASearchDestinationView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressCell = tableView.dequeue(class: TAAddressCell.self, for: indexPath)
        return addressCell
    }
    
}

// MARK: - UITableViewDelegate

extension TASearchDestinationView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.kCellHeight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let addressModel = viewModel.item(for: indexPath)
        let isLastElement = viewModel.isLastItem(by: indexPath)
        
        guard let addressCell = cell as? TAAddressCell else {
            assertionFailure("required")
            return
        }
        addressCell.set(addressModel: addressModel)
        addressCell.isSeparatorHidden = isLastElement
        addressCell.contentOffset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: -36)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.actAddressField(at: indexPath)
    }
    
}
