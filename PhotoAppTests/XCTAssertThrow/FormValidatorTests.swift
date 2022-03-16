//
//  FormValidatorTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 14/3/22.
//

import XCTest
@testable import PhotoApp

class FormValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        // Arrange
        let sut = FormModelValidator()

        // Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid(firstName: "Finsi*"),
                             "The isFirstNameValid() method should has thrown an error.") { error in
            XCTAssertEqual(error as? FormError, FormError.illigalCharacterFound)
        }
    }

    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError_UsingTryCatch() {
        // Arrange
        let sut = FormModelValidator()

        // Act and Assert
        do {
            let _ = try sut.isFirstNameValid(firstName: "Finsi*")
            XCTFail("The isFirstNameValid() method should has thrown an error.")
        } catch FormError.illigalCharacterFound {
            // Success
            return
        } catch {
            XCTFail("The isFirstNameValid() method should has thrown an illigalCharacterFound error.")
            return
        }
    }

    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoError() {
        // Arrange
        let sut = FormModelValidator()

        // Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid(firstName: "Finsi"), "The isFirstNameValid() method shouldn't has thrown an error.")
    }

    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoError_UsingTryCatch() {
        // Arrange
        let sut = FormModelValidator()

        // Act and Assert
        do {
            let _ = try sut.isFirstNameValid(firstName: "Finsi")
        } catch {
            XCTFail("he isFirstNameValid() method shouldn't has thrown an error.")
            return
        }
    }
}
