//
//  MockRaceAPIProtocol.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import NetworkCore

public final class MockRaceAPIProtocol: RaceAPIProtocol {
    
    public init() {}
    
   // MARK: - getRaces

    public var getRacesForThrowableError: Error?
    public var getRacesForCallsCount = 0
    public var getRacesForCalled: Bool {
        getRacesForCallsCount > 0
    }
    public var getRacesForReceivedSeason: Int?
    public var getRacesForReceivedInvocations: [Int] = []
    public var getRacesForReturnValue: APIRacePayload!
    public var getRacesForClosure: ((Int) throws -> APIRacePayload)?

    public func getRaces(for season: Int) throws -> APIRacePayload {
        if let error = getRacesForThrowableError {
            throw error
        }
        getRacesForCallsCount += 1
        getRacesForReceivedSeason = season
        getRacesForReceivedInvocations.append(season)
        return try getRacesForClosure.map({ try $0(season) }) ?? getRacesForReturnValue
    }
}
