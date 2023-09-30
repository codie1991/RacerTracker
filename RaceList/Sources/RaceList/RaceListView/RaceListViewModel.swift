//
//  RaceListViewModel.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import SwiftUI
import UseCaseProtocol

@MainActor public final class RaceListViewModel: ObservableObject {
    
    private let getSeasonsRacesUseCase: GetSeasonsRacesUseCaseProtocol
    
    @Published public private(set) var races: [RaceItem] = []
    @Published public private(set) var remainingRaces: [RaceItem] = []
    @Published public private(set) var isFetchingData = false
    
    public init(getSeasonsRacesUseCase: GetSeasonsRacesUseCaseProtocol) {
        self.getSeasonsRacesUseCase = getSeasonsRacesUseCase
    }
    
    public func fetchRaceData(for season: Int, isRefreshing: Bool = false) async {
        
        if !isRefreshing {
            isFetchingData = true
        }
        
        do {
            races = try await getSeasonsRacesUseCase.execute(for: season)
                .map{ RaceItem(race: $0) }
            remainingRaces = races.filter({ $0.isRaceCompleted == false })
        } catch {
            // TODO: handle
        }
        
        isFetchingData = false
    }
}
