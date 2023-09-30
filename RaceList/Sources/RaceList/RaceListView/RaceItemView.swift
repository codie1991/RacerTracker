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
            VStack(alignment: .leading) {
                Text("Round \(raceItem.round)")
                    .font(.caption)
                    .foregroundColor(.red)
                Text(raceItem.raceName)
                    .font(.title2)
                Text(raceItem.circuit.circuitName)
                    .font(.body)
                VStack(alignment: .center, content: {
                    HStack {
                        Image(systemName: "flag.checkered")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Grand Prix Weekend")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                        .overlay(.white)
                    HStack {
                        Spacer()
                        VStack {
                            Text("\(raceItem.countdown?.day ?? 0)")
                                .font(.title)
                                .fontWeight(.heavy)
                            Text("DAYS")
                                .font(.subheadline)
                        }
                        Spacer()
                        Divider()
                            .overlay(.white)
                        Spacer()
                        VStack {
                            Text("\(raceItem.countdown?.hour ?? 0)")
                                .font(.title)
                                .fontWeight(.heavy)
                            Text("HRS")
                                .font(.subheadline)
                        }
                        Spacer()
                        Divider()
                            .overlay(.white)
                        Spacer()
                        VStack {
                            Text("\(raceItem.countdown?.minute ?? 0)")
                                .font(.title)
                                .fontWeight(.heavy)
                            Text("MINS")
                                .font(.subheadline)
                        }
                        Spacer()
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
