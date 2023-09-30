//
//  TrackDateTime.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Foundation
public protocol TrackDateTime {
    
    /// Date string in the format of `yyyy-MM-dd`
    var date: String { get }
    
    /// Time string in the format of `HH:mm:ssZ`
    var time: String { get }
}

extension TrackDateTime {
    
    /// The ISO8601 formatted date time string
    public var iso8601DateString: String {
        "\(date)T\(time)"
    }
    
    /// Date in UTC for the start of the track time
    public var dateTime: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: iso8601DateString)
    }
}
