//
//  Container+Injections.swift
//  RacerTracker
//
//  Created by Codie Westphall on 28/09/23.
//

import Factory
import NetworkCore
import NetworkExtension
import Pilot
import Repositories
import RepositoryProtocol
import UseCaseProtocol
import UseCases
import RaceList



@MainActor
extension Container {
    
    // Network
    public var raceAPI: Factory<RaceAPIProtocol> {
        self { Pilot<RaceRoute>() }
            .scope(.cached)
    }
    
    // Repositories
    public var raceRepository: Factory<RaceRepositoryProtocol> {
        self { RaceRepository(raceAPI: self.raceAPI()) }
            .scope(.cached)
    }

    // UseCases
    public var getSeasonsRacesUseCase: Factory<GetSeasonsRacesUseCaseProtocol> {
        self { GetSeasonsRacesUseCase(repository: self.raceRepository()) }
            .scope(.cached)
    }
    
    // ViewModels
    public var raceListViewModel: Factory<RaceListViewModel> {
        self {
            RaceListViewModel(
                getSeasonsRacesUseCase: self.getSeasonsRacesUseCase()
            )
        }
    }
}
