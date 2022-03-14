//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 25/1/22.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
