//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 3/1/22.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Finsi")

        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "F")

        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "FinsiFinsiSi")

        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        let isLastNameValid = sut.isLastNameValid("Ennes")

        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }

    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        let isLastNameValid = sut.isLastNameValid("EnnesEnnes")

        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isEmailValid = sut.isEmailValid("finsi.ennes@gmail.com")

        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }

    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        let isEmailValid = sut.isEmailValid("finsigmail.com")

        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned FALSE for a invalid email but returned TRUE")
    }

    func testSignupFormModelValidator_WhenPasswordsProvidedMatch_ShouldReturnTrue() {
        // Act
        let doPasswordMatch = sut.doPasswordMatch(password: "1234567", repeatPassword: "1234567")

        // Assert
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for a matching passwords but returned FALSE")
    }

    func testSignupFormModelValidator_WhenPasswordsProvidedDoesNotMatch_ShouldReturnFalse() {
        // Act
        let doPasswordMatch = sut.doPasswordMatch(password: "1234567", repeatPassword: "7654321")

        // Assert
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned FALSE for a non matching passwords but returned TRUE")
    }

}
