//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 20/1/22.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {

    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private var delegate: SignupViewDelegateProtocol?

    required init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }

    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }

        if !formModelValidator.isLastNameValid(formModel.lastName) {
            return
        }

        if !formModelValidator.isEmailValid(formModel.email) {
            return
        }

        if !formModelValidator.isPasswordValid(formModel.password) {
            return
        }

        if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }

        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)

        webService.signup(withForm: requestModel) { [weak self] responseModel, error in
            if let _ = responseModel {
                self?.delegate?.successfulSignup()
            } else if let error = error {
                self?.delegate?.errorHandler(error: error)
            }
            return
        }
    }
}
