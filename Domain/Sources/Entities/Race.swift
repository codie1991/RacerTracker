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
    var date: String { get }
    var time: String { get }
    var firstPractice: TrackDateTime { get }
    var secondPractice: TrackDateTime { get }
    var thirdPractice: TrackDateTime? { get }
    var qualifying: TrackDateTime { get }
    var sprint: TrackDateTime? { get }
}
