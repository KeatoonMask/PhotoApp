//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 10/1/22.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)

        sut = SignupWebService(urlString: SignupConstants.signupUrlString,
                               urlSession: urlSession)

        signFormRequestModel = SignupFormRequestModel(firstName: "Finsi",
                                                      lastName: "Ennes",
                                                      email: "test@test.com",
                                                      password: "12345abcde")
    }

    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {

        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")

        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenDifferentJSONResponse_ErrorTookPlace() {

        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")

        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel,
                         "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsing,
                           "The signup() method did not resturn expexted error")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")

        sut = SignupWebService(urlString: "")

        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidadRequestURLString")
            XCTAssertNil(signupResponseModel, "When a invalidadRequestURLString takes place, the response model must be nil.")
            expectation.fulfill()
        }


        self.wait(for: [expectation], timeout: 2)

    }

    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        MockURLProtocol.error = SignupError.failedRequest

        // Act
        sut.signup(withForm: signFormRequestModel) { SignupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest, "The signup() method did not return an expecter error for the Failed Request")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
}
