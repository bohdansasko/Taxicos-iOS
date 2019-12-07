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
    
    // MARK: - Properties
    
    let viewModel: TAOnboardingViewModel
    let pages: [UIViewController]
    
    // MARK: - UI
    
    private let pageController: UIPageViewController = {
        let pc = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        return pc
    }()
    
    private let pageControl: CHIPageControlJaloro = {
        let pc = CHIPageControlJaloro()
        pc.elementWidth  = 25
        pc.elementHeight = 6
        pc.radius        = 3
        pc.padding       = 6
        pc.currentPageTintColor = #colorLiteral(red: 0.2549019608, green: 0.3137254902, blue: 0.6196078431, alpha: 0.7)
        pc.tintColor            = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 0.5)
        return pc
    }()
    
    private let skipButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ONBOARDING_SKIP".localized, for: .normal)
        return btn
    }()

    private let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ONBOARDING_NEXT".localized, for: .normal)
        return btn
    }()
    
    private let skipNextButtonsSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 30
        return sv
    }()
    
    private let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ONBOARDING_DONE".localized, for: .normal)
        return btn
    }()

    // MARK: - View lifecycle
    
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

private extension TAOnboardingRootView {
    
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
        
        skipNextButtonsSV.addArrangedSubview(skipButton)
        skipNextButtonsSV.addArrangedSubview(nextButton)
        addSubview(skipNextButtonsSV)
        skipNextButtonsSV.snp.makeConstraints {
            $0.right.equalToSuperview().inset(30)
            $0.centerY.equalTo(pageControl.snp.centerY)
        }
        
        addSubview(doneButton)
        doneButton.snp.makeConstraints{ $0.edges.equalTo(nextButton) }
    }
    
    func setupButtonHandlers() {
        skipButton.addTarget(viewModel, action: #selector(TAOnboardingViewModel.actSkipButton))
        nextButton.addTarget(viewModel, action: #selector(TAOnboardingViewModel.actNextButton))
        doneButton.addTarget(viewModel, action: #selector(TAOnboardingViewModel.actDoneButton))
    }
    
    func setupPageSubscription() {
        pageControl.numberOfPages = viewModel.kNumberOfPages
        viewModel.currentPageNumber
            .asDriver(onErrorJustReturn: viewModel.kStartNumberPage)
            .drive(onNext: { [unowned self] pageNumber in
                let pageIndex = pageNumber - 1
                self.moveTo(pageIndex: pageIndex)
                self.updateButtonsVisibility()
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Page navigation

private extension TAOnboardingRootView {
    
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
    
    func updateButtonsVisibility() {
        skipNextButtonsSV.isHidden =  viewModel.isLastPage
        doneButton.isHidden        = !viewModel.isLastPage
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
        
        doneButton.setTitleColor(theme.colors.onboardingNextButtonColor, for: .normal)
        doneButton.titleLabel!.font = theme.colors.onboardingNextButtonFont
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
