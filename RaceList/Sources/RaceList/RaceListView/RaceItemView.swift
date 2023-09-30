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
        HStack(alignment: .center) {
            if raceItem.isRaceCompleted {
                Image(systemName: "checkmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.green)
            } else {
                Image(systemName: "flag.checkered")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
            
            VStack(alignment: .leading) {
                Text("Round \(raceItem.round)")
                    .font(.caption)
                    .foregroundColor(.red)
                Text(raceItem.raceName)
                    .font(.title2)
                Text(raceItem.circuit.circuitName)
                    .font(.caption)
                
            }
            .padding(10)
        }
    }
}

struct HeroRaceItemView: View {
    
    private let raceItem: RaceItem
    
    init(raceItem: RaceItem) {
        self.raceItem = raceItem
    }
    
    var body: some View {
        HStack(alignment: .center) {
            if raceItem.isRaceCompleted {
                Image(systemName: "checkmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.green)
            } else {
                Image(systemName: "flag.checkered")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
            
            VStack(alignment: .leading) {
                Text("Round \(raceItem.round)")
                    .font(.caption)
                    .foregroundColor(.red)
                Text(raceItem.raceName)
                    .font(.title2)
                Text(raceItem.circuit.circuitName)
                    .font(.caption)
                VStack(alignment: .center, content: {
                    Text("Grand Prix Weekend")
                    Divider()
                        .overlay(.white)
                    HStack {
                        VStack {
                            Text("\(raceItem.countdown?.day ?? 0)")
                                .font(.headline)
                            Text("DAYS")
                                .font(.subheadline)
                        }
                        Divider()
                            .overlay(.white)
                        VStack {
                            Text("\(raceItem.countdown?.hour ?? 0)")
                                .font(.headline)
                            Text("HRS")
                                .font(.subheadline)
                        }
                        Divider()
                            .overlay(.white)
                        VStack {
                            Text("\(raceItem.countdown?.minute ?? 0)")
                                .font(.headline)
                            Text("MINS")
                                .font(.subheadline)
                        }
                    }
                })
                .padding(16)
                .foregroundColor(.white)
                .background(Color(hue: 120/360, saturation: 0.5, brightness: 0.40))
                .cornerRadius(16)
            }
            .padding(10)
        }
    }
}

struct RaceItemView_Previews: PreviewProvider {
    static var previews: some View {
        RaceItemView(raceItem: .mock)
    }
}

struct HeroRaceItemView_Previews: PreviewProvider {
    static var previews: some View {
        HeroRaceItemView(raceItem: .mock)
    }
}
