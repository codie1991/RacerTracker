//
//  RaceLocation.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Foundation

public protocol RaceLocation {
    var lat: String { get }
    var long: String { get }
    var locality: String { get }
    var country: String { get }
}
