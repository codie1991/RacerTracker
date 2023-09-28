//
//  GetSeasonsRacesUseCaseProtocol.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Entities

public protocol GetSeasonsRacesUseCaseProtocol {
    
    func execute(for season: Int) async throws -> [Race]
    
}
