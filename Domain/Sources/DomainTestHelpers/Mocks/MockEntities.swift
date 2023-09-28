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
    public let date: String
    public let time: String
    public let firstPractice: Entities.TrackDateTime
    public let secondPractice: Entities.TrackDateTime
    public let thirdPractice: Entities.TrackDateTime?
    public let qualifying: Entities.TrackDateTime
    public let sprint: Entities.TrackDateTime?
    
    public static func == (lhs: MockRace, rhs: MockRace) -> Bool {
        lhs.season == rhs.season &&
        lhs.round == rhs.round &&
        lhs.raceName == rhs.raceName &&
        MockCircuit(circuit: lhs.circuit) == MockCircuit(circuit: rhs.circuit) &&
        lhs.date == rhs.date &&
        lhs.time == rhs.time
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
        date: "2023-04-02",
        time: "05:00:00Z",
        firstPractice: MockTrackDateTime(date: "2023-03-31", time: "01:30:00Z"),
        secondPractice: MockTrackDateTime(date: "2023-03-31", time: "05:00:00Z"),
        thirdPractice: MockTrackDateTime(date: "2023-04-01", time: "01:30:00Z"),
        qualifying: MockTrackDateTime(date: "2023-04-01", time: "05:00:00Z"),
        sprint: nil
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
