//
//  MainModuleOutput.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

protocol MainModuleOutput: class {
    var onOpenOTP: ((OTPFieldType) -> Void)? { get set }
}
