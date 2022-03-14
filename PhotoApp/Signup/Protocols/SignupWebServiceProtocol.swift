//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 25/1/22.
//

import Foundation

protocol SignupWebServiceProtocol {

    func signup(withForm formModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
