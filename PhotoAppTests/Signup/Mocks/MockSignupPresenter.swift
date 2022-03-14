//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 9/3/22.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled = false

    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        // TODO
    }

    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
