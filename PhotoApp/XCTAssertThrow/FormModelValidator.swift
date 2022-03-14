//
//  FormModelValidator.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 14/3/22.
//

import Foundation

class FormModelValidator {

    private let invalidCharacters = CharacterSet(charactersIn: "{}#$%^&*.,/?!@")

    func isFirstNameValid(firstName: String) throws -> Bool {
        var returnValue = true

        if firstName.rangeOfCharacter(from: invalidCharacters) != nil {
            throw FormError.illigalCharacterFound
        }

        if firstName.count < SignupConstants.firstNameMinLength ||
            firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }

        return returnValue
    }
}
