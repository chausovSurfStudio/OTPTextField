//
//  DefaultPinedView.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

public final class DefaultPinedView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var indicatorView: UIView!

    // MARK: - UIView

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Pin Container

extension DefaultPinedView: PinContainer {

    public func set(value: String?) {
        codeLabel.text = value
    }

    public func clear() {
        codeLabel.text = nil
    }

    public func animateIndicator() {
        startIndicatorAnimation()
    }

    public func removeIndicator() {
        stopIndicatorAnimation()
    }

}

// MARK: - Configuration

private extension DefaultPinedView {

    func setupInitialState() {
        configureContainerView()
        configureCodeLabel()
        configureIndicatorView()
    }

    func configureContainerView() {
        containerView.backgroundColor = UIColor(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1.0)
        containerView.layer.cornerRadius = 2.0
        containerView.layer.masksToBounds = true
    }

    func configureCodeLabel() {
        codeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        codeLabel.textColor = UIColor.black
        codeLabel.textAlignment = .center
        codeLabel.text = nil
    }

    func configureIndicatorView() {
        indicatorView.backgroundColor = UIColor(red: 130 / 255, green: 0, blue: 104 / 255, alpha: 1.0)
        indicatorView.isHidden = true
    }

}

// MARK: - Animation

private extension DefaultPinedView {

    func startIndicatorAnimation() {
        let appearAnimation = CABasicAnimation(keyPath: "opacity")
        appearAnimation.fromValue = 0.0
        appearAnimation.toValue = 1.0
        appearAnimation.duration = 0.5
        appearAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)

        let disappearAnimation = CABasicAnimation(keyPath: "opacity")
        disappearAnimation.fromValue = 1.0
        disappearAnimation.toValue = 0.0
        disappearAnimation.duration = 0.5
        disappearAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [appearAnimation, disappearAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity

        indicatorView.isHidden = false
        indicatorView.layer.add(animationGroup, forKey: "fade")
    }

    func stopIndicatorAnimation() {
        indicatorView.isHidden = true
        indicatorView.layer.removeAllAnimations()
    }

}
