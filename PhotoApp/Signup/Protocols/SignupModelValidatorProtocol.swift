//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 20/1/22.
//

import Foundation

protocol SignupModelValidatorProtocol {

    func isFirstNameValid(firstName: String) -> Bool

    func isLastNameValid(_ lastName: String) -> Bool

    func isEmailValid(_ email: String) -> Bool

    func isPasswordValid(_ password: String) -> Bool

    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}
