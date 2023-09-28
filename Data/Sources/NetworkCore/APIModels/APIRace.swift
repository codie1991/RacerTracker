//
//  APIRace.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation

// MARK: - RaceTable
public struct RaceTable: Decodable, Equatable {
    public let season: String
    public let races: [APIRace]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

// MARK: - Race
public struct APIRace: Codable, Equatable {
    public let season, round: String
    public let url: String
    public let raceName: String
    public let apiCircuit: APICircuit
    public let date, time: String
    public let apiFirstPractice, apiSecondPractice: APITrackDateTime
    public let apiThirdPractice: APITrackDateTime?
    public let apiQualifying: APITrackDateTime
    public let apiSprint: APITrackDateTime?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case apiCircuit = "Circuit"
        case date, time
        case apiFirstPractice = "FirstPractice"
        case apiSecondPractice = "SecondPractice"
        case apiThirdPractice = "ThirdPractice"
        case apiQualifying = "Qualifying"
        case apiSprint = "Sprint"
    }
}

// MARK: - Circuit
public struct APICircuit: Codable, Equatable {
    public let circuitID: String
    public let url: String
    public let circuitName: String
    public let apiLocation: APILocation

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case apiLocation = "Location"
    }
}

// MARK: - Location
public struct APILocation: Codable, Equatable {
    public let lat, long, locality, country: String
}

// MARK: - FirstPractice
public struct APITrackDateTime: Codable, Equatable {
    public let date, time: String
}
