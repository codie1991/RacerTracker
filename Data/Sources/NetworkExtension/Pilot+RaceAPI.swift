//
//  File.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import NetworkCore
import Pilot

extension Pilot: RaceAPIProtocol where R == RaceRoute {
    
    public func getRaces(for season: Int) async throws -> APIRacePayload {
        return try await request(
            .getRaces(season),
            target: APIRacePayload.self,
            decoder: .apiDecoder
        )
    }
    
}
