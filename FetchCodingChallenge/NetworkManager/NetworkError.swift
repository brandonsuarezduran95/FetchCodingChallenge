//
//  NetworkError.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import Foundation

enum NetworkError:String, Error {
    case badURL
    case badServerResponse
    case badParsing
}
