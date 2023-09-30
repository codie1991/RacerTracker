//
//  File.swift
//  
//
//  Created by Codie Westphall on 29/09/23.
//

import Foundation

public extension DateFormatter {

    static let shortMonth: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM"
        return df
    }()
    
    static let shortDay: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd"
        return df
    }()
}
