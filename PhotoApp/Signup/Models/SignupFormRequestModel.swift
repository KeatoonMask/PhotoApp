//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 10/1/22.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
