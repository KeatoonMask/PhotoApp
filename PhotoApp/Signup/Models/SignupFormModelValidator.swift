//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 3/1/22.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {

    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true

        if firstName.count < SignupConstants.firstNameMinLength ||
            firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }

    func isLastNameValid(_ lastName: String) -> Bool {
        return lastName.count > SignupConstants.lastNameMinLength ||
            lastName.count < SignupConstants.lastNameMaxLength
    }

    func isEmailValid(_ email: String) -> Bool {
        return email.contains("@") || email.contains(".")
    }

    func isPasswordValid(_ password: String) -> Bool {
        return password.count >= 6
    }

    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
