//
//  ListViewModelTests.swift
//  brasileirao-luizsoaresTests
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import XCTest

@testable import brasileirao_luizsoares

class ListViewModelTests: XCTestCase {
    
    fileprivate var viewmodel: ListViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewmodel = ListViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testListRounds() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "ListRounds")
        
        GamesService().requestRounds { [unowned self] (apiresult) in
            switch apiresult {
            case .success(let round):
                self.viewmodel.round = round
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(self.viewmodel.round)
    }
    
    func testListGames() {
        let expectation = self.expectation(description: "ListGames")
        
        GamesService().requestGames(round: 38) { (apiresult) in
            switch apiresult {
            case .success(let games):
                self.viewmodel.games = games
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(self.viewmodel.games.count > 0)
    }

}
