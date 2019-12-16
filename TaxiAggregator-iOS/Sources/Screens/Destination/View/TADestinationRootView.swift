//
//  TADestinationRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 19.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import RxSwift
import RxKeyboard

final class TADestinationRootView: TABaseView {
    
    // MARK: - Properties
    
    private let _viewModel: TADestinationViewModel
    
    // MARK: - UI
    
    private let fromToView: TAFromToAddressView = {
        let v = TAFromToAddressView()
        return v
    }()
 
    private let addressesTable: UITableView = {
        let tv = TAUIFactory.makeTableView()
        tv.register(class: TAAddressCell.self)
        tv.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
        return tv
    }()
    
    private let chooseOnMapButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.3137254902, blue: 0.6196078431, alpha: 1)
        b.setTitle("TAXIS_CHOOSE_ON_MAP".localized, for: .normal)
        b.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        b.titleLabel!.font = UIFont.avenir(weight: .medium, fontSize: 16)
        return b
    }()
    
    // MARK: - Lifecycle
    
    init(frame: CGRect = .zero, viewModel: TADestinationViewModel) {
        _viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        setupSubscriptions()
        setupKeyboardSubscription()
        
        fromToView.toTextField().becomeFirstResponder()
    }
}

// MARK: - Setup

private extension TADestinationRootView {
    
    func setupLayout() {
        addSubview(fromToView)
        fromToView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(96)
        }
        
        addressesTable.dataSource = self
        addressesTable.delegate = self
        addSubview(addressesTable)
        addressesTable.snp.makeConstraints {
            $0.top.equalTo(fromToView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
        }
        
        addSubview(chooseOnMapButton)
        chooseOnMapButton.snp.makeConstraints {
            $0.top.equalTo(addressesTable.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.snp.bottom)
            $0.height.equalTo(46)
        }
        chooseOnMapButton.addTarget(
            _viewModel,
            action: #selector(TADestinationViewModel.actChooseLocationOnMap(_:))
        )
    }
    
    func setupSubscriptions() {
        fromToView.activeAddressTyping
            .bind(to: _viewModel.activeAddressTyping)
            .disposed(by: disposeBag)
        
        fromToView.fromTextField().rx
            .controlEvent(.editingDidBegin)
            .subscribe(onNext: { [unowned self] in
                self._viewModel.searchForLocations(using: self.fromToView.fromTextField().text ?? "")
            })
                .disposed(by: disposeBag)
        
        fromToView.fromTextField().rx
            .text
            .orEmpty
            .throttle(.milliseconds(600), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] queryText in
                self._viewModel.searchForLocations(using: queryText)
            })
            .disposed(by: disposeBag)

        fromToView.toTextField().rx
            .controlEvent(.editingDidBegin)
            .subscribe(onNext: { [unowned self] in
                self._viewModel.searchForLocations(using: self.fromToView.toTextField().text ?? "")
            })
            .disposed(by: disposeBag)

        fromToView.toTextField().rx
            .text
            .orEmpty
            .throttle(.milliseconds(600), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] queryText in
                self._viewModel.searchForLocations(using: queryText)
            })
            .disposed(by: disposeBag)
        
        _viewModel.addressesResults
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { _ in
                self.addressesTable.reloadData()
            })
            .disposed(by: disposeBag)

        
        _viewModel.fromAddress
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [unowned self] address in
                self.fromToView.fromTextField().text = address?.shortAddress
            })
            .disposed(by: disposeBag)

        _viewModel.toAddress
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [unowned self] address in
                self.fromToView.toTextField().text = address?.shortAddress
            })
            .disposed(by: disposeBag)
        
        themeProvider.register(observer: self)
    }
    
    func setupKeyboardSubscription() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [unowned self] kbHeight in
                self.chooseOnMapButton.snp.updateConstraints {
                    $0.bottom.equalTo(self.snp.bottom).inset(kbHeight)
                }
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - TAThemeable

extension TADestinationRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
    }

}

// MARK: - UITableViewDataSource

extension TADestinationRootView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressCell = tableView.dequeue(class: TAAddressCell.self, for: indexPath)
        return addressCell
    }
    
}

// MARK: - UITableViewDelegate

extension TADestinationRootView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(_viewModel.kCellHeight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let addressModel = _viewModel.item(for: indexPath)
        let isLastElement = _viewModel.isLastItem(by: indexPath)
        
        guard let addressCell = cell as? TAAddressCell else {
            assertionFailure("required")
            return
        }
        addressCell.set(addressModel: addressModel)
        addressCell.isSeparatorHidden = isLastElement
        addressCell.contentOffset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: -18)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        _viewModel.actAddressField(at: indexPath)
    }
    
}
