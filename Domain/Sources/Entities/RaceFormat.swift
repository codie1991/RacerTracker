//
//  File.swift
//  
//
//  Created by Codie Westphall on 29/09/23.
//

import Foundation

/// Composition of races over the weekend for a given `Race`
public enum RaceFormat {
    
    /// Standard weekend format, Practice 1, Practice 2, Practice 3, Qualifying, + Race
    case normal
    
    /// Sprint weekend format, Practice 1, Qualifying, Sprint shootout, Sprint, + Race
    case sprint
}
