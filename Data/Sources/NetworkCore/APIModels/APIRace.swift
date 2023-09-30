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

// MARK: - APIRace
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
    
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<APIRace.CodingKeys> = try decoder.container(keyedBy: APIRace.CodingKeys.self)
        
        self.season = try container.decode(String.self, forKey: APIRace.CodingKeys.season)
        self.round = try container.decode(String.self, forKey: APIRace.CodingKeys.round)
        self.url = try container.decode(String.self, forKey: APIRace.CodingKeys.url)
        self.raceName = try container.decode(String.self, forKey: APIRace.CodingKeys.raceName)
        self.apiCircuit = try container.decode(APICircuit.self, forKey: APIRace.CodingKeys.apiCircuit)
        
        let _date: String = try container.decode(String.self, forKey: APIRace.CodingKeys.date)
        let _time: String = try container.decode(String.self, forKey: APIRace.CodingKeys.time)
        
        let _apiFirstPractice = try container.decode(APITrackDateTime.self, forKey: APIRace.CodingKeys.apiFirstPractice)
        let _apiSecondPractice = try container.decode(APITrackDateTime.self, forKey: APIRace.CodingKeys.apiSecondPractice)
        let _apiThirdPractice = try container.decodeIfPresent(APITrackDateTime.self, forKey: APIRace.CodingKeys.apiThirdPractice)
        let _apiQualifying = try container.decode(APITrackDateTime.self, forKey: APIRace.CodingKeys.apiQualifying)
        let _apiSprint = try container.decodeIfPresent(APITrackDateTime.self, forKey: APIRace.CodingKeys.apiSprint)
        
        // Apply TimeZone correction to API data
        if let correction = TimeZoneMiddleware.timeFixMap["\(season) \(apiCircuit.circuitID)"] {
            
            // Race correction
            let correctedDateTime = TimeZoneMiddleware.fix(
                date: _date,
                time: _time,
                byAdding: correction.component,
                value: correction.value
            )
            self.date = correctedDateTime.date
            self.time = correctedDateTime.time
            
            // P1 correction
            let correctedP1DateTime = TimeZoneMiddleware.fix(
                date: _apiFirstPractice.date,
                time: _apiFirstPractice.time,
                byAdding: correction.component,
                value: correction.value
            )
            self.apiFirstPractice = correctedP1DateTime
            
            // P2 correction
            let correctedP2DateTime = TimeZoneMiddleware.fix(
                date: _apiSecondPractice.date,
                time: _apiSecondPractice.time,
                byAdding: correction.component,
                value: correction.value
            )
            self.apiSecondPractice = correctedP2DateTime
            
            // P3 correction
            if let _apiThirdPractice {
                let correctedP3DateTime = TimeZoneMiddleware.fix(
                    date: _apiThirdPractice.date,
                    time: _apiThirdPractice.time,
                    byAdding: correction.component,
                    value: correction.value
                )
                self.apiThirdPractice = correctedP3DateTime
            } else {
                self.apiThirdPractice = nil
            }
            
            // Quali correction
            let correctedQDateTime = TimeZoneMiddleware.fix(
                date: _apiQualifying.date,
                time: _apiQualifying.time,
                byAdding: correction.component,
                value: correction.value
            )
            self.apiQualifying = correctedQDateTime
            
            // Sprint correction
            if let _apiSprint {
                let correctedSDateTime = TimeZoneMiddleware.fix(
                    date: _apiSprint.date,
                    time: _apiSprint.time,
                    byAdding: correction.component,
                    value: correction.value
                )
                self.apiSprint = correctedSDateTime
            } else {
                self.apiSprint = nil
            }
            
        } else {
            self.date = _date
            self.time = _time
            
            self.apiFirstPractice = _apiFirstPractice
            self.apiSecondPractice = _apiSecondPractice
            self.apiThirdPractice = _apiThirdPractice
            self.apiQualifying = _apiQualifying
            self.apiSprint = _apiSprint
        }
        
    }
}

// MARK: - APICircuit
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

// MARK: - APILocation
public struct APILocation: Codable, Equatable {
    public let lat, long, locality, country: String
}

// MARK: - APITrackDateTime
public struct APITrackDateTime: Codable, Equatable {
    public init(date: String, time: String) {
        self.date = date
        self.time = time
    }
    
    public let date, time: String
    
    enum CodingKeys: CodingKey {
        case date
        case time
    }
    
}

// MARK: - TimeZoneMiddleware
struct TimeZoneMiddleware {
    
    static let timeFixMap: [String:(component: Calendar.Component, value: Int)] = [
        "2023 losail": (component: .hour, value: 3)
    ]
    
    static func fix(
        date: String,
        time: String,
        byAdding component: Calendar.Component,
        value: Int
    ) -> APITrackDateTime {
        let isoDateFormatter = ISO8601DateFormatter()
        let dateTimeType = isoDateFormatter.date(from: "\(date)T\(time)")!
        let calendar = Calendar.current
        guard let correctedDateTime = calendar.date(
            byAdding: component,
            value: value,
            to: dateTimeType
        ) else {
            fatalError()
        }
        
        let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            return df
        }()
        
        let timeFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateFormat = "HH:mm:ssZ"
            return df
        }()
        
        return APITrackDateTime(
            date: dateFormatter.string(from: correctedDateTime),
            time: timeFormatter.string(from: correctedDateTime)
        )
    }
    
}
