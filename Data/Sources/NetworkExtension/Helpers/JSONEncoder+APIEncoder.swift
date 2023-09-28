//
//  JSONEncoder+APIEncoder.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation

extension JSONEncoder {

    public static let apiEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}
