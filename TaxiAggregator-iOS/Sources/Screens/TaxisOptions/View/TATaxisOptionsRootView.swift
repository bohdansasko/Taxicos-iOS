//
//  TATaxisOptionsRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class TATaxisOptionsRootView: TABaseView {
    
    // MARK: - Models
    
    fileprivate let viewModel: TATaxisOptionsViewModel
    
    // MARK: - UI
    
    private let taxisOptionsTable: UITableView = {
        let tv = TAUIFactory.makeTableView()
        tv.register(class: TATaxiOptionCell.self)
        return tv
    }()
    
    private let topSeparatorView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        return v
    }()
    
    // MARK: - Methods
    
    init(frame: CGRect = .zero, viewModel: TATaxisOptionsViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
                
        setupLayout()
        setupSubscriptionsToViewModel()
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

private extension TATaxisOptionsRootView {
    
    func setupLayout() {
        addSubview(topSeparatorView)
        topSeparatorView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        addSubview(taxisOptionsTable)
        taxisOptionsTable.snp.makeConstraints {
            $0.top.equalTo(topSeparatorView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        taxisOptionsTable.delegate = self
        taxisOptionsTable.dataSource = self
        
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}

// MARK: - Subscriptions

private extension TATaxisOptionsRootView {
    
    func setupSubscriptionsToViewModel() {
        viewModel.items
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { [weak self] items in
                self?.taxisOptionsTable.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.activityIndicatorAnimating
            .asDriver(onErrorJustReturn: false)
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
    }
    
}

// MARK: - TAThemeable

extension TATaxisOptionsRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
    }

}

// MARK: - UITableViewDataSource

extension TATaxisOptionsRootView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressCell = tableView.dequeue(class: TATaxiOptionCell.self, for: indexPath)
        return addressCell
    }
    
}

// MARK: - UITableViewDelegate

extension TATaxisOptionsRootView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.kCellHeight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let taxiModel = viewModel.item(for: indexPath)
        
        let taxiCell = cell as! TATaxiOptionCell
        taxiCell.item = taxiModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.actTaxiField(at: indexPath)
    }
    
}
