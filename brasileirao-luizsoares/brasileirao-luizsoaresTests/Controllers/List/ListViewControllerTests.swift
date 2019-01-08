//
//  ListViewControllerTests.swift
//  brasileirao-luizsoaresTests
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import XCTest

@testable import brasileirao_luizsoares

class ListViewControllerTests: XCTestCase {
    
    var controller: ListViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let navController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController
        XCTAssertNotNil(navController)
        
        XCTAssertTrue(navController!.topViewController is ListViewController)
        
        self.controller = navController!.topViewController as! ListViewController
        
        self.controller.loadViewIfNeeded()
        
        XCTAssertNotNil(self.controller as? ListProtocol)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.controller = nil
        super.tearDown()
    }

    func testOutlets() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(self.controller.collectionView)
        XCTAssertNotNil(self.controller.collectionView.delegate)
        XCTAssertNotNil(self.controller.collectionView.dataSource)
        
        XCTAssertNotNil(self.controller.tblView)
        XCTAssertNotNil(self.controller.tblView.delegate)
        XCTAssertNotNil(self.controller.tblView.dataSource)
        
        let collectionCell = self.controller.collectionView.dequeueReusableCell(withReuseIdentifier: RoundCollectionViewCell.cellIdentifier(),
                                                                                for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(collectionCell)
        
        let tblCell = self.controller.tblView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier())
        XCTAssertNotNil(tblCell, "Table should dequeue reusable cell")
        
//        for subview in self.controller.tblView.subviews {
//            if subview is UIRefreshControl {
//                XCTAssert(subview is UIRefreshControl)
//            }
//        }
//        XCTAssertNil("Missing UIRefreshControl")
    }

    func testRoundRequestSuccess() {
//        self.viewmodel.assignController(controller: self.controller)
//        sleep(15)
        var round = RoundEntity()
        round.current = 38
        round.total = 38
        
        self.controller.viewModel.round = round
        self.controller.viewModel.selectedRound = round.current
        
        XCTAssertNotNil(self.controller.viewModel.round)
        
        self.controller.reloadCollection()
        
        XCTAssertTrue(self.controller.collectionView.numberOfItems(inSection: 0) == self.controller.viewModel.round!.total)
        let cell = self.controller.collectionView.dataSource?.collectionView(self.controller.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is RoundCollectionViewCell)
        XCTAssertFalse(self.controller.collectionView.isHidden)
    }
    
    func testRequestGamesSuccess() {
//        self.viewmodel.loadGames(round: 1)
//        sleep(15)
//        XCTAssertTrue(self.viewmodel.games.count > 0)
//        XCTAssertTrue(self.controller.tblView.numberOfRows(inSection: 0) == self.viewmodel.games.count)
//        XCTAssertTrue(self.controller.tblView.cellForRow(at: IndexPath(row: 0, section: 0)) is ListTableViewCell)
//        XCTAssertFalse(self.controller.tblView.isHidden)
    }

}
