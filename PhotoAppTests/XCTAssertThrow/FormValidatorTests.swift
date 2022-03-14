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
                             "The should isFirstNameValid() method has thrown an error.") { error in
            XCTAssertEqual(error as? FormError, FormError.illigalCharacterFound)
        }
    }

}
