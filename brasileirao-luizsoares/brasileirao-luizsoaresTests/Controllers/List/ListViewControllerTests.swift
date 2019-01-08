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
    var viewmodel: ListViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let navController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController
        XCTAssertNotNil(navController)
        
        XCTAssertTrue(navController!.topViewController is ListViewController)
        
        self.controller = navController!.topViewController as! ListViewController
        
        XCTAssertNotNil(self.controller as? ListProtocol)
        
        self.viewmodel = ListViewModel()
        
        self.viewmodel.assignController(controller: self.controller)
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
    }

    func testRoundRequestSuccess() {
//        self.viewmodel.loadRounds()
//        
//        let predicate = NSPredicate(format: "self.controller.collectioView.isHidden == false")
//        
//        let expectation = self.expectation(for: predicate, evaluatedWith: self.controller.collectionView, handler: nil)
//        
//        let result = XCTWaiter().wait(for: [expectation], timeout: 10)
//        
//        switch result {
//        case .timedOut:
//            XCTAssertNotNil(self.viewmodel.round)
//            XCTAssertTrue(self.controller.collectionView.numberOfItems(inSection: 0) == self.viewmodel.round!.total)
//            let cell = self.controller.collectionView.dataSource?.collectionView(self.controller.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
//            XCTAssertTrue(cell is RoundCollectionViewCell)
//            break
//        default:
//            XCTAssertTrue(false)
//            break
//        }
//        var round = RoundEntity()
//        round.current = 38
//        round.total = 38
        
//        self.controller.viewModel.round = round
//        self.controller.viewModel.selectedRound = round.current
        
//        XCTAssertNotNil(self.controller.viewModel.round)
        
//        self.controller.reloadCollection()
        
//        XCTAssertTrue(self.controller.collectionView.numberOfItems(inSection: 0) == self.controller.viewModel.round!.total)
//        let cell = self.controller.collectionView.dataSource?.collectionView(self.controller.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
//        XCTAssertTrue(cell is RoundCollectionViewCell)
//        XCTAssertFalse(self.controller.collectionView.isHidden)
    }
    
    func testRequestGamesSuccess() {
//        self.viewmodel.loadGames(round: 38)
//        
//        let predicate = NSPredicate(format: "self.controller.tblView.isHidden == false")
//        
//        let expectation = self.expectation(for: predicate, evaluatedWith: self.controller.tblView, handler: nil)
//        
//        let result = XCTWaiter().wait(for: [expectation], timeout: 10)
//        
//        switch result {
//        case .timedOut:
//            XCTAssertTrue(self.controller.tblView.numberOfRows(inSection: 0) == self.viewmodel.games.count)
//            let cell = self.controller.tblView.dataSource?.tableView(self.controller.tblView, cellForRowAt: IndexPath(row: 0, section: 0))
//            XCTAssertTrue(cell is ListTableViewCell)
//            break
//        default:
//            XCTAssertTrue(false)
//            break
//        }
    }

}
