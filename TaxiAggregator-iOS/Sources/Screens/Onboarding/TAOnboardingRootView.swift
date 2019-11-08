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
    let pages: [UIViewController]
    
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

    init(frame: CGRect = .zero, viewModel: TAOnboardingViewModel, pages: [UIViewController]) {
        self.viewModel = viewModel
        self.pages     = pages
        super.init(frame: frame)
        
        setupLayout()
        setupButtonHandlers()
        setupPageSubscription()
        
        themeProvider.register(observer: self)
    }
    
}

// MARK: - Setup

extension TAOnboardingRootView {
    
    func setupLayout() {
        addSubview(pageController.view)
        pageController.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        pageController.delegate = self
        pageController.dataSource = self
        
        
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
    
    func setupPageSubscription() {
        pageControl.numberOfPages = viewModel.kNumberOfPages
        viewModel.currentPageNumber
            .asDriver(onErrorJustReturn: viewModel.kStartNumberPage)
            .drive(onNext: { [unowned self] pageNumber in
                let pageIndex = pageNumber - 1
                self.moveTo(pageIndex: pageIndex)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Page navigation

extension TAOnboardingRootView {
    
    func moveTo(pageIndex: Int, animated: Bool = true) {
        let currentPage = pages[pageIndex]
        pageController.setViewControllers(
            [currentPage],
            direction: .forward,
            animated: true,
            completion: nil
        )
        
        self.pageControl.set(progress: pageIndex, animated: animated)
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

// MARK: - UIPageViewControllerDataSource

extension TAOnboardingRootView: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let prevViewControllerIndex = viewControllerIndex - 1
        guard prevViewControllerIndex >= 0 else {
            return pages.last
        }
        
        guard pages.count > prevViewControllerIndex else {
            return nil
        }
        
        return pages[prevViewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextViewControllerIndex = viewControllerIndex + 1
        guard nextViewControllerIndex < pages.count else {
            return pages.first
        }
        
        return pages[nextViewControllerIndex]
    }
    
}

// MARK: - UIPageViewControllerDelegate

extension TAOnboardingRootView: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentViewController = pageViewController.viewControllers?.last else {
            return
        }
        guard let currentIndex = pages.firstIndex(of: currentViewController) else {
            return
        }
        viewModel.moveTo(page: currentIndex + 1)
    }
    
}
