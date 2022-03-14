//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 20/1/22.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockupSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!

    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Finsi",
                                              lastName: "Ennes",
                                              email: "test@test.com",
                                              password: "123abc",
                                              repeatPassword: "123abc")

        mockSignupModelValidator = MockSignupModelValidator()
        mockupSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()

        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockupSignupWebService,
                              delegate: mockSignupViewDelegate)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockupSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange

        // Act
        sut.processUserSignup(formModel: signupFormModel)

        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatch, "Did not validate if passwords match")
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processUserSignup(formModel: signupFormModel)

        // Assert
        XCTAssertTrue(mockupSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }

    func testSignupPresenter_WhenSignupOperationSuccesful_CallsSuccessOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the successfulSignup() method to be called")

        mockSignupViewDelegate.expectation = expectation

        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignup() method was called more that once")
    }

    func testSignupPresenter_WhenSignupOperationFails_CallsErrorHandlerOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the errorHandler() method to be called")

        mockSignupViewDelegate.expectation = expectation
        mockupSignupWebService.signupResponseModelStatus = "KO"

        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerSignupCounter, 1, "The errorHandler() method was called more that once")
    }

}
