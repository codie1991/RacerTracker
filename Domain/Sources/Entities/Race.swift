//
//  Race.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Foundation

public protocol Race {
    var season: String { get }
    var round: String { get }
    var url: String { get }
    var raceName: String { get }
    var circuit: Circuit { get }
    var raceTime: TrackDateTime { get }
    var firstPractice: TrackDateTime { get }
    var secondPractice: TrackDateTime { get }
    var thirdPractice: TrackDateTime? { get }
    var qualifying: TrackDateTime { get }
    var sprint: TrackDateTime? { get }
}

extension Race {
    
    public var weekendFormat: RaceFormat {
        if thirdPractice != nil {
            return .normal
        } else if sprint != nil {
            return .sprint
        } else {
            fatalError("Non-standard weekend format")
        }
    }
    
    public var isRaceCompleted: Bool {
        guard let raceStartTime = raceTime.dateTime else {
            fatalError("`Race` properties `date` and `time` couldn't be used to create a `Date`")
        }
        // Formula 1 races vary in length, but have a maximum imposed time of 3 hours
        let calendar = Calendar.current
        guard let f1MaxEndTime = calendar.date(byAdding: .hour, value: 3, to: raceStartTime) else {
            fatalError("Couldn't add 3 hours to the provided `raceTime.dateTime` value")
        }
        
        return f1MaxEndTime < Date()
    }
    
    public var countdown: DateComponents? {
        guard let raceStartTime = firstPractice.dateTime else {
            fatalError("`firstPractice` properties `date` and `time` couldn't be used to create a `Date`")
        }
        
        if raceStartTime < Date() {
            return nil
        }
        
        // Convert dates' diference to days, hours, minutes and seconds
        return Calendar.current.dateComponents([.day, .hour, .minute], from: Date(), to: raceStartTime)
    }
    
}
