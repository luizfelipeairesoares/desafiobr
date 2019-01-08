//
//  DetailViewModelTests.swift
//  brasileirao-luizsoaresTests
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import XCTest

@testable import brasileirao_luizsoares

class DetailViewModelTests: XCTestCase {
    
    var viewmodel: DetailViewModel!
    var controller: DetailViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewmodel = DetailViewModel()
        self.controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailViewController.storyboardID()) as! DetailViewController
        XCTAssertNotNil(self.controller)
        self.viewmodel.assignController(controller: self.controller)
        self.controller.assignGame(game: GameEntity())
        self.controller.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewmodel = nil
        self.controller = nil
        super.tearDown()
    }

    func testGameplayRequest() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var game = GameEntity()
        game.gameID = 1
        self.viewmodel.currentGame = game
        
        self.viewmodel.loadGameplay()
        
        let predicate = NSPredicate(format: "self.viewmodel.gameplay.count > 0")
        
        let expectation = self.expectation(for: predicate, evaluatedWith: self.viewmodel.gameplay, handler: nil)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 10)
        
        switch result {
        case .timedOut:
            XCTAssertTrue(self.viewmodel.gameplay.count > 0)
            break
        default:
            XCTAssertTrue(false)
            break
        }
    }

}
