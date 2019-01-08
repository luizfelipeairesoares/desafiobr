//
//  DetailViewControllerTests.swift
//  brasileirao-luizsoaresTests
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import XCTest

@testable import brasileirao_luizsoares

class DetailViewControllerTests: XCTestCase {
    
    var controller: DetailViewController!
    
    var game: GameEntity!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailViewController.storyboardID()) as! DetailViewController
        XCTAssertNotNil(self.controller)
        self.controller.loadViewIfNeeded()
        
        if let jsonPath = Bundle.main.path(forResource: "GameMock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath), options: .mappedIfSafe)
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String : Any] {
                    if let game = GameEntity.decode(json) {
                        self.game = game
                    }
                }
            } catch {
                print(error)
                XCTAssertTrue(false)
            }
        } else {
            XCTAssertTrue(false)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.controller = nil
        super.tearDown()
    }

    func testOutlets() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.controller.loadViewIfNeeded()
        XCTAssertNotNil(self.controller.lblAwayTeam)
        XCTAssertNotNil(self.controller.lblDateTime)
        XCTAssertNotNil(self.controller.lblHomeTeam)
        XCTAssertNotNil(self.controller.lblAwayScore)
        XCTAssertNotNil(self.controller.lblHomeScore)
        XCTAssertNotNil(self.controller.imgAwayTeam)
        XCTAssertNotNil(self.controller.imgHomeTeam)
        XCTAssertNotNil(self.controller.tblView)
        XCTAssertNotNil(self.controller.tblView.delegate)
        XCTAssertNotNil(self.controller.tblView.dataSource)
        
        let tblCell = self.controller.tblView.dequeueReusableCell(withIdentifier: PlayTableViewCell.cellIdentifier())
        XCTAssertNotNil(tblCell, "Table should dequeue reusable cell")
    }
    
    func testGameConfigured() {
        self.controller.assignGame(game: self.game)
        
        self.controller.viewWillAppear(false)
        
        let away = self.game.teams["visitante"] as! TeamEntity
        let home = self.game.teams["mandante"] as! TeamEntity
        
        XCTAssertTrue(self.controller.lblAwayTeam.text == away.initials)
        XCTAssertTrue(self.controller.lblDateTime.text == self.game.date.formatAPIDate()! + "  " + self.game.local.name + "  " + self.game.time)
        XCTAssertTrue(self.controller.lblHomeTeam.text == home.initials)
        XCTAssertTrue(self.controller.lblAwayScore.text == "\(self.game.awayScore)")
        XCTAssertTrue(self.controller.lblHomeScore.text == "\(self.game.homeScore)")
    }
}
