//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Serafín Ennes Moscoso on 10/1/22.
//

import Foundation

enum SignupError: Error {
    case responseModelParsing
    case invalidRequestURLString
    case failedRequest
}
