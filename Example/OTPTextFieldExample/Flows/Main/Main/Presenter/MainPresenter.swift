//
//  MainPresenter.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class MainPresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var onOpenOTP: ((OTPFieldType) -> Void)?

    // MARK: - Properties

    weak var view: MainViewInput?

}

// MARK: - MainModuleInput

extension MainPresenter: MainModuleInput {
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

    func openOTP(with type: OTPFieldType) {
        onOpenOTP?(type)
    }

}
