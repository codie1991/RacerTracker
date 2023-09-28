//
//  MockRaceRepositoryProtocol.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import RepositoryProtocol
import Entities

public final class MockRaceRepositoryProtocol: RaceRepositoryProtocol {

    public init() {}
    
   // MARK: - getRaces

    public var getRacesForThrowableError: Error?
    public var getRacesForCallsCount = 0
    public var getRacesForCalled: Bool {
        getRacesForCallsCount > 0
    }
    public var getRacesForReceivedSeason: Int?
    public var getRacesForReceivedInvocations: [Int] = []
    public var getRacesForReturnValue: [Race]!
    public var getRacesForClosure: ((Int) throws -> [Race])?

    
    public func getRaces(for season: Int) throws -> [Race] {
        if let error = getRacesForThrowableError {
            throw error
        }
        getRacesForCallsCount += 1
        getRacesForReceivedSeason = season
        getRacesForReceivedInvocations.append(season)
        return try getRacesForClosure.map({ try $0(season) }) ?? getRacesForReturnValue
    }
}
