//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 25/1/22.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerSignupCounter = 0

    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }

    func errorHandler(error: SignupError) {
        errorHandlerSignupCounter += 1
        expectation?.fulfill()
    }
}
