//
//  File.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Entities
import Foundation
import NetworkCore
import RepositoryProtocol

public class RaceRepository: RaceRepositoryProtocol {
    
    private let raceAPI: RaceAPIProtocol
    
    public init(raceAPI: RaceAPIProtocol) {
        self.raceAPI = raceAPI
    }
    
    public func getRaces(for season: Int) async throws -> [Race] {
        let payload = try await raceAPI.getRaces(for: season)
        return payload.mrData.raceTable.races
    }
    
}

extension APITrackDateTime: TrackDateTime {}
extension APILocation: RaceLocation {}
extension APICircuit: Circuit{
    public var location: Entities.RaceLocation { apiLocation }
}
extension APIRace: Race {
    public var circuit: Entities.Circuit { apiCircuit }
    
    public var firstPractice: Entities.TrackDateTime { apiFirstPractice }
    
    public var secondPractice: Entities.TrackDateTime { apiSecondPractice }
    
    public var thirdPractice: Entities.TrackDateTime? { apiThirdPractice }
    
    public var qualifying: Entities.TrackDateTime { apiQualifying }
    
    public var sprint: Entities.TrackDateTime? { apiSprint }
}
