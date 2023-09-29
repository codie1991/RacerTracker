//
//  RaceItem.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import DomainTestHelpers
import Entities

public struct RaceItem: Identifiable, Equatable {
    
    public var id: String { season+round+raceName }
    
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String
    public let firstPractice: TrackDateTime
    public let secondPractice: TrackDateTime
    public let thirdPractice: TrackDateTime?
    public let qualifying: TrackDateTime
    public let sprint: TrackDateTime?
    
    public init(race: Race) {
        self.season = race.season
        self.round = race.round
        self.url = race.url
        self.raceName = race.raceName
        self.circuit = race.circuit
        self.date = race.date
        self.time = race.time
        self.firstPractice = race.firstPractice
        self.secondPractice = race.secondPractice
        self.thirdPractice = race.thirdPractice
        self.qualifying = race.qualifying
        self.sprint = race.sprint
    }
    
    public static func == (lhs: RaceItem, rhs: RaceItem) -> Bool {
        lhs.season == rhs.season &&
        lhs.round == rhs.round &&
        lhs.raceName == rhs.raceName &&
        lhs.date == rhs.date &&
        lhs.time == rhs.time
    }
}

#if DEBUG
extension RaceItem {
    static let mock = RaceItem(race: MockRace.australianGrandPrix)
}
#endif
