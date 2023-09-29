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

// MARK: - MockGetSeasonsRacesUseCaseProtocol -

public final class MockGetSeasonsRacesUseCaseProtocol: GetSeasonsRacesUseCaseProtocol {
    
    public init() {}
    
   // MARK: - execute

    var executeForThrowableError: Error?
    var executeForCallsCount = 0
    var executeForCalled: Bool {
        executeForCallsCount > 0
    }
    var executeForReceivedSeason: Int?
    var executeForReceivedInvocations: [Int] = []
    var executeForReturnValue: [Race]!
    var executeForClosure: ((Int) throws -> [Race])?

    public func execute(for season: Int) throws -> [Race] {
        if let error = executeForThrowableError {
            throw error
        }
        executeForCallsCount += 1
        executeForReceivedSeason = season
        executeForReceivedInvocations.append(season)
        return try executeForClosure.map({ try $0(season) }) ?? executeForReturnValue
    }
}
