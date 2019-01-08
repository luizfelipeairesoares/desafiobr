//
//  GamesServiceTests.swift
//  brasileirao-luizsoaresTests
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import XCTest
import Moya

@testable import brasileirao_luizsoares

class GamesServiceTests: XCTestCase {
    
    fileprivate var game: GameEntity? = nil
    
    fileprivate var stubProvider: MoyaProvider<BrasileiraoAPI>!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCTAssertNotNil(GamesService())
        
        let endpointClosure = { (target: BrasileiraoAPI) -> Endpoint in
            let url = URL(target: target).absoluteString
            return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        self.stubProvider = MoyaProvider<BrasileiraoAPI>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRoundsSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "RoundsSuccess")
        
        var requestResult = false
        
        self.stubProvider.request(.rounds) { (result) in
            switch result {
            case .success(let response):
                do {
                    let round = try GamesService().handleResponseObject(response: response) as RoundEntity
                    print(round)
                } catch {
                    print(error)
                }
                requestResult = true
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(requestResult)
    }
    
    func testRoundsFailure() {
        let expectation = self.expectation(description: "RoundsFailure")
        
        var result = true
        
        let service = GamesService()
        
        service.requestRounds { (apiresult) in
            switch apiresult {
            case .success(_):
                expectation.fulfill()
            case .failure(_):
                result = false
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertFalse(result)
    }
    
    func testGamesSuccess() {
        let expectation = self.expectation(description: "GamesSuccess")
        
        var result = false
        
        GamesService().requestGames(round: 1) { [unowned self] (apiresult) in
            switch apiresult {
            case .success(let games):
                if games.count > 0 {
                    self.game = games.first
                }
                result = true
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(result)
    }
    
    func testsGamesFailure() {
        let expectation = self.expectation(description: "GamesFailure")
        
        var result = true
        
        GamesService().requestGames(round: 1) { (apiresult) in
            switch apiresult {
            case .success(_):
                expectation.fulfill()
            case .failure(_):
                result = false
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertFalse(result)
    }
    
    func testGameplaySuccess() {
        if let game = self.game {
            let expectation = self.expectation(description: "GameplaySuccess")
            
            var result = false
            
            GamesService().requestGameplay(gameID: game.gameID) { (apiresult) in
                switch apiresult {
                case .success(_):
                    result = true
                    expectation.fulfill()
                case .failure(_):
                    expectation.fulfill()
                }
            }
            
            waitForExpectations(timeout: 10, handler: nil)
            
            XCTAssertTrue(result)
        }
    }
    
    func testGameplayFailure() {
        if let game = self.game {
            let expectation = self.expectation(description: "GameplayFailure")
            
            var result = true
            
            GamesService().requestGameplay(gameID: game.gameID) { (apiresult) in
                switch apiresult {
                case .success(_):
                    expectation.fulfill()
                case .failure(_):
                    result = false
                    expectation.fulfill()
                }
            }
            
            waitForExpectations(timeout: 10, handler: nil)
            
            XCTAssertFalse(result)
        }
    }

}
