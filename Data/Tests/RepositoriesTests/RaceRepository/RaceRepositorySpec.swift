//
//  RaceRepositorySpec.swift
//  
//
//  Created by Codie Westphall on 28/09/23.
//

import DataTestHelpers
import NetworkCore
import Nimble
import Quick
@testable import Repositories

final class RaceRepositorySpec: QuickSpec {
    
    override func spec() {
        
        var raceAPI: MockRaceAPIProtocol!
        var raceRepository: RaceRepository!
        
        describe("the RaceRepository") {
            
            beforeEach {
                raceAPI = MockRaceAPIProtocol()
                raceRepository = RaceRepository(raceAPI: raceAPI)
            }
            
            describe("calling getRaces(with:season)") {
                context("when the raceAPI returns successfully") {
                    let argsSeason: Int = 2023
                    let expectedRaces = APIRace.dummyRacesPayload
                    
                    beforeEach {
                        raceAPI.getRacesForClosure = { season in
                            if season == argsSeason {
                                return expectedRaces
                            }
                            return APIRace.dummyRacesPayloadEmpty
                        }
                    }
                    
                    it("it returns the correct values") {
                        await expect {
                            try await raceRepository.getRaces(for: argsSeason).compactMap { $0 as? APIRace }
                        }
                        .to(equal(expectedRaces.mrData.raceTable.races))
                    }
                }
                
                context("When the raceAPI returns failures") {
                    let argsInvalid = 2022
                    let expectedError = TestError.fail("API error")
                    
                    beforeEach {
                        raceAPI.getRacesForThrowableError = expectedError
                    }
                    
                    it("returns correct error") {
                        await expect {
                            try await raceRepository.getRaces(for: argsInvalid)
                        }
                        .to(throwError { error in
                            expect(error).to(equal(expectedError))
                        })
                    }
                }
            }
        }
    }
    
}
