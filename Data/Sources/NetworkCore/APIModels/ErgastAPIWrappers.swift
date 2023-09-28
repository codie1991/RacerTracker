//
//  ErgastAPIWrappers.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation

// MARK: - Payload
public struct APIRacePayload: Decodable, Equatable {
    public let mrData: APIRaceMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - MRData
public struct APIRaceMRData: Decodable, Equatable {
    public let xmlns: String
    public let series: String
    public let url: String
    public let limit, offset, total: String
    public let raceTable: RaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}
