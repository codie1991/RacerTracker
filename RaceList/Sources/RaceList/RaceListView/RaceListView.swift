//
//  RaceListView.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import SwiftUI
import DomainTestHelpers
import UseCaseProtocol

public struct RaceListView: View {
    
    @ObservedObject private var viewModel: RaceListViewModel
    
    public init(viewModel: RaceListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List {
            ForEach(viewModel.races.indices, id: \.self) { index in
                RaceItemView(raceItem: viewModel.races[index])
            }
        }
        .listStyle(.insetGrouped)
        .task {
            await viewModel.fetchRaceData(for: 2023)
        }
        .refreshable {
            await viewModel.fetchRaceData(for: 2023,isRefreshing: true)
        }
        
    }
}



struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView(
            viewModel: RaceListViewModel(
                getSeasonsRacesUseCase: MockGetSeasonsRacesUseCaseProtocol()
            )
        )
    }
}
