//
//  String+Utf8Data.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation

public extension String {

    var utf8Data: Data { .init(utf8) }
}
