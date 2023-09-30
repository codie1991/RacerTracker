//
//  File.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Entities

public struct MockCircuit: Circuit, Equatable {
    
    public let circuitID: String
    public let url: String
    public let circuitName: String
    public let location: Entities.RaceLocation
    
    public static func == (lhs: MockCircuit, rhs: MockCircuit) -> Bool {
        lhs.circuitID == rhs.circuitID
    }
    
    public init(circuit: Circuit) {
        self.circuitID = circuit.circuitID
        self.url = circuit.url
        self.circuitName = circuit.circuitName
        self.location = circuit.location
    }
    
    public init(circuitID: String, url: String, circuitName: String, location: RaceLocation) {
        self.circuitID = circuitID
        self.url = url
        self.circuitName = circuitName
        self.location = location
    }
}

public struct MockRace: Race, Equatable {
    
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Entities.Circuit
    public let raceTime: TrackDateTime
    public let firstPractice: TrackDateTime
    public let secondPractice: TrackDateTime
    public let thirdPractice: TrackDateTime?
    public let qualifying: TrackDateTime
    public let sprint: TrackDateTime?
    
    public static func == (lhs: MockRace, rhs: MockRace) -> Bool {
        lhs.season == rhs.season &&
        lhs.round == rhs.round &&
        lhs.raceName == rhs.raceName &&
        MockCircuit(circuit: lhs.circuit) == MockCircuit(circuit: rhs.circuit) &&
        lhs.raceTime.date == rhs.raceTime.date &&
        lhs.raceTime.time == rhs.raceTime.time
    }
    
}

public extension MockRace {
    
    static let australianGrandPrix = MockRace(
        season: "2023",
        round: "3",
        url: "https://en.wikipedia.org/wiki/2023_Australian_Grand_Prix",
        raceName: "Australian Grand Prix",
        circuit: MockCircuit(
            circuitID: "albert-park",
            url: "http://en.wikipedia.org/wiki/Melbourne_Grand_Prix_Circuit",
            circuitName: "Albert Park Grand Prix Circuit",
            location: MockRaceLocation(
                lat: "-37.8497",
                long: "144.968",
                locality: "Melbourne",
                country: "Australia"
            )
        ), 
        raceTime: MockTrackDateTime(date: "2023-04-02", time: "05:00:00Z"),
        firstPractice: MockTrackDateTime(date: "2023-03-31", time: "01:30:00Z"),
        secondPractice: MockTrackDateTime(date: "2023-03-31", time: "05:00:00Z"),
        thirdPractice: MockTrackDateTime(date: "2023-04-01", time: "01:30:00Z"),
        qualifying: MockTrackDateTime(date: "2023-04-01", time: "05:00:00Z"),
        sprint: nil
    )
    
    static let qatarGrandPrix = MockRace(
        season: "2023",
        round: "17",
        url: "https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix",
        raceName: "Qatar Grand Prix",
        circuit: MockCircuit(
            circuitID: "losail",
            url: "http://en.wikipedia.org/wiki/Losail_International_Circuit",
            circuitName: "Losail International Circuit",
            location: MockRaceLocation(
                lat: "25.49",
                long: "51.4542",
                locality: "Al Daayen",
                country: "Qatar"
            )
        ),
        raceTime: MockTrackDateTime(date: "2023-10-08", time: "14:00:00Z"),
        firstPractice: MockTrackDateTime(date: "2023-10-06", time: "10:30:00Z"),
        secondPractice: MockTrackDateTime(date: "2023-10-07", time: "10:30:00Z"),
        thirdPractice: nil,
        qualifying: MockTrackDateTime(date: "2023-10-06", time: "14:00:00Z"),
        sprint: MockTrackDateTime(date: "2023-10-07", time: "14:30:00Z")
    )
    
}

public struct MockRaceLocation: RaceLocation, Equatable {
    
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
    
}

public struct MockTrackDateTime: TrackDateTime, Equatable {
    public let date: String
    public let time: String
}
