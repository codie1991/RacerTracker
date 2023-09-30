//
//  RaceItem.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import DomainTestHelpers
import Entities
import Foundation

public struct RaceItem: Identifiable, Equatable {
    
    public var id: String { season+round+raceName }
    
    private let race: Race
    
    public var season: String { race.season }
    public var round: String { race.round }
    public var url: String { race.url }
    public var raceName: String { race.raceName }
    public var circuit: Circuit { race.circuit}
    public var raceTime: TrackDateTime { race.raceTime }
    public var firstPractice: TrackDateTime { race.firstPractice }
    public var secondPractice: TrackDateTime { race.secondPractice }
    public var thirdPractice: TrackDateTime? { race.thirdPractice}
    public var qualifying: TrackDateTime { race.qualifying }
    public var sprint: TrackDateTime? { race.sprint}
    
    
    
    public init(race: Race) {
        self.race = race
    }
    
    public static func == (lhs: RaceItem, rhs: RaceItem) -> Bool {
        lhs.season == rhs.season &&
        lhs.round == rhs.round &&
        lhs.raceName == rhs.raceName &&
        lhs.raceTime.date == rhs.raceTime.date &&
        lhs.raceTime.time == rhs.raceTime.time
    }
    
    public var weekendFormat: RaceFormat {
        race.weekendFormat
    }
    
    public var isRaceCompleted: Bool {
        race.isRaceCompleted
    }
    
    public var countdown: DateComponents? {
        race.countdown
    }
}

#if DEBUG
extension RaceItem {
    static let mock = RaceItem(race: MockRace.qatarGrandPrix)
}
#endif
