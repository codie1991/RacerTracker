//
//  GetSeasonsRacesUseCaseSpec.swift
//  
//
//  Created by Codie Westphall on 27/09/23.
//

import Nimble
import Quick
import DomainTestHelpers
import RepositoryProtocol
import UseCaseProtocol
@testable import UseCases

final class GetSeasonsRacesUseCaseSpec: QuickSpec {
    
    override func spec() {
        var getSeasonsRaceUseCase: GetSeasonsRacesUseCaseProtocol!
        var raceRepository: MockRaceRepositoryProtocol!
        
        describe("the GetSeasonsRacesUseCase") {
            beforeEach {
                raceRepository = MockRaceRepositoryProtocol()
                getSeasonsRaceUseCase = GetSeasonsRacesUseCase(repository: raceRepository)
            }
            
            describe("testing execute(for:)") {
                context("when raceRepository returns success") {
                    let argsSeason = 2023
                    let expectedRaces = [MockRace.australianGrandPrix]
                    
                    beforeEach {
                        raceRepository.getRacesForClosure = { season in
                            if season == argsSeason {
                                return expectedRaces
                            }
                            return []
                        }
                    }
                    
                    it("returns correct value") {
                        await expect {
                            try await getSeasonsRaceUseCase.execute(for: argsSeason).compactMap({ $0 as? MockRace })
                        }
                        .to(equal(expectedRaces))
                    }
                    
                }
                
                context("when raceRepository returns failure") {
                    let argsInvalid = 2022
                    let expectedError = TestError.fail("API error")
                    
                    beforeEach {
                        raceRepository.getRacesForThrowableError = expectedError
                    }
                    
                    it("returns correct error") {
                        await expect {
                            try await getSeasonsRaceUseCase.execute(for: argsInvalid)
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
