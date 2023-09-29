//
//  RaceItemView.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import SwiftUI

struct RaceItemView: View {
    
    private let raceItem: RaceItem
    
    init(raceItem: RaceItem) {
        self.raceItem = raceItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Round \(raceItem.round)")
                .font(.body)
                .foregroundColor(.red)
            Text(raceItem.raceName)
                .font(.title2)
            
        }
        .padding(10)
    }
}

struct RaceItemView_Previews: PreviewProvider {
    static var previews: some View {
        RaceItemView(raceItem: .mock)
    }
}
