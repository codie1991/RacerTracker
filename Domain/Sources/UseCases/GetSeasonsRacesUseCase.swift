//
//  GetSeasonsRacesUseCase.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class GetSeasonsRacesUseCase: GetSeasonsRacesUseCaseProtocol {
    
    private let repository: RaceRepositoryProtocol
    
    public init(repository: RaceRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(for season: Int) async throws -> [Race] {
        return try await repository.getRaces(for: season)
    }
    
}
