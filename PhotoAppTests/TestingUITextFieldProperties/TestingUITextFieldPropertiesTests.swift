//
//  TestingUITextFieldPropertiesTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 3/5/22.
//

import XCTest
@testable import PhotoApp

class TestingUITextFieldPropertiesTests: XCTestCase {

    var sut: TextFieldViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "TextFieldViewController", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TextFieldViewController") as? TextFieldViewController

        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        XCTAssertEqual(emailTextField.textContentType, .emailAddress)
    }
    
    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress)
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Email address UITextField is not connected")
        XCTAssertTrue(passwordTextField.isSecureTextEntry)
    }
}
