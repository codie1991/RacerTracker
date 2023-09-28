//
//  Circuit.swift
//
//
//  Created by Codie Westphall on 27/09/23.
//

import Foundation

public protocol Circuit {
    var circuitID: String { get }
    var url: String { get }
    var circuitName: String { get }
    var location: RaceLocation { get }
}

