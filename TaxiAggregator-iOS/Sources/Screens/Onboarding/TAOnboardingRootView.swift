//
//  TAOnboardingRootView.swift
//  TaxiAggregator-iOS
//
//  Created by Bogdan Sasko on 03.11.2019.
//  Copyright © 2019 Vinso. All rights reserved.
//

import UIKit
import CHIPageControl

final class TAOnboardingRootView: TABaseView {
    let viewModel: TAOnboardingViewModel
    
    let pageController: UIPageViewController = {
        let pc = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        return pc
    }()
    
    let pageControl: CHIPageControlJaloro = {
        let pc = CHIPageControlJaloro()
        pc.numberOfPages = 3
        pc.elementWidth  = 25
        pc.elementHeight = 6
        pc.radius        = 3
        pc.padding       = 6
        pc.currentPageTintColor = #colorLiteral(red: 0.2549019608, green: 0.3137254902, blue: 0.6196078431, alpha: 0.7)
        pc.tintColor            = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 0.5)
        return pc
    }()
    
    let skipButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ONBOARDING_SKIP".localized, for: .normal)
        return btn
    }()

    let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ONBOARDING_NEXT".localized, for: .normal)
        return btn
    }()

    init(frame: CGRect = .zero, viewModel: TAOnboardingViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        setupLayout()
        setupButtonHandlers()
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

extension TAOnboardingRootView {
    
    func setupLayout() {
        addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.bottom.equalTo(self.layoutMarginsGuide.snp.bottomMargin).inset(40)
        }
        
        let buttonsSV = UIStackView(arrangedSubviews: [skipButton, nextButton])
        buttonsSV.axis = .horizontal
        buttonsSV.spacing = 30
        addSubview(buttonsSV)
        buttonsSV.snp.makeConstraints {
            $0.right.equalToSuperview().inset(30)
            $0.centerY.equalTo(pageControl.snp.centerY)
        }
    }
    
    func setupButtonHandlers() {
        skipButton.addTarget(viewModel, action: #selector(TAOnboardingViewModel.actSkipButton))
        nextButton.addTarget(viewModel, action: #selector(TAOnboardingViewModel.actNextButton))
    }
    
}

// MARK: - TAThemeable

extension TAOnboardingRootView: TAThemeable {
        
    func apply(theme: TATheme) {
        backgroundColor = theme.colors.backgroundColor
        
        skipButton.setTitleColor(theme.colors.onboardingSkipButtonColor, for: .normal)
        skipButton.titleLabel!.font = theme.colors.onboardingSkipButtonFont
        
        nextButton.setTitleColor(theme.colors.onboardingNextButtonColor, for: .normal)
        nextButton.titleLabel!.font = theme.colors.onboardingNextButtonFont
    }

}
