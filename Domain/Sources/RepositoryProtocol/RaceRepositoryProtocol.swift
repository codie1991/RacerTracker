//
//  RaceRepositoryProtocol.swift
//
//
//  Created by Codie Westphall on 27/09/23.
//

import Entities

public protocol RaceRepositoryProtocol {
    
    func getRaces(for season: Int) async throws -> [Race]
    
}
