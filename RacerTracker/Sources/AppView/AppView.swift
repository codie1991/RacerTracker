//
//  ContentView.swift
//  RacerTracker
//
//  Created by Codie Westphall on 27/09/23.
//

import Factory
import RaceList
import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationView {
            ZStack {
                RaceListView(
                    viewModel: Container.shared.raceListViewModel()
                )
            }
        }
    }
}

#Preview {
    AppView()
}
