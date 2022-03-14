//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 9/3/22.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {

    init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol)

    func processUserSignup(formModel: SignupFormModel)
}
