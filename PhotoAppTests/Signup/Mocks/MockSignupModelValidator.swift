//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 20/1/22.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {

    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var doPasswordsMatch: Bool = false


    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }

    func isLastNameValid(_ lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }

    func isEmailValid(_ email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }

    func isPasswordValid(_ password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }

    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        doPasswordsMatch = true
        return doPasswordsMatch
    }
}
