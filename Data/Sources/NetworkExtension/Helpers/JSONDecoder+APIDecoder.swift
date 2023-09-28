//
//  JSONDecoder+APIDecoder.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation

extension JSONDecoder {

    public static let apiDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
