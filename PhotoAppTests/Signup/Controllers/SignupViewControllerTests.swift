//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 9/3/22.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!

    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {

        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")

        XCTAssertEqual(firstNameTextField.text, "", "First Name text field was not empty when view controller is loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last Name text field was not empty when view controller is loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when view controller is loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when view controller is loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password text field was not empty when view controller is loaded")
    }

    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "The signupButton is not connected to an IBOutlet")

        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "The signupButton is not connected to an IBOutlet")

        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:")
    }

    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()

        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator,
                                                      webService: mockSignupWebService,
                                                      delegate: mockSignupViewDelegate)

        sut.signupPresenter = mockSignupPresenter

        // Act
        sut.signupButton.sendActions(for: .touchUpInside)

        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignyp() method was not called on a Presenter object when the signupButton was tapped on the SignupViewController")
    }
}
