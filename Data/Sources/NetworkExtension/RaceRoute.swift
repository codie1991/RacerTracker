//
//  File.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import Foundation
import PilotType

public enum RaceRoute {
    
    case getRaces(Int)
    
}

extension RaceRoute: Route {
    
    public var baseURL: URL { .init(string: "http://ergast.com/api/f1")! }
    
    public var path: String {
        switch self {
        case .getRaces(let season):
            return "/\(season).json"
        }
    }
    
    public var httpMethod: HttpMethod { .get }
    
    public var httpHeaders: HttpHeaders {
        ["Content-Type": "application/json"]
    }
    
    public var parameters: Parameters? {
        switch self {
        case .getRaces: return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding? {
        switch self {
        case .getRaces: return nil
        }
    }
}
