//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Serafín Ennes Moscoso on 25/1/22.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {

    var isSignupMethodCalled: Bool = false
    var signupResponseModelStatus: String = "OK" // SuccessfulSignup by default

    func signup(withForm formModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true

        let signupResponseModel = SignupResponseModel(status: signupResponseModelStatus)

        if signupResponseModel.status == "OK" {
            completionHandler(signupResponseModel, nil)
        } else {
            completionHandler(nil, .failedRequest)
        }
    }
}
