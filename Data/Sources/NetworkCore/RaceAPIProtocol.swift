//
//  File.swift
//
//
//  Created by Codie Westphall on 28/09/23.
//

public protocol RaceAPIProtocol {
    
    func getRaces(for season: Int) async throws -> APIRacePayload
    
}

