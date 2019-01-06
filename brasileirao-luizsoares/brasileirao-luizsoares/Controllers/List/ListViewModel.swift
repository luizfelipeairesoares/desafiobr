//
//  ListViewModel.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

protocol ListProtocol : ControllerProtocol {
    
    func reloadTable()
    
}

class ListViewModel {
    
    // MARK: - Variables
    
    fileprivate weak var controller: ListProtocol?
    
    internal var games: [[String : Any]] = []
    
    // MARK: - Functions
    
    internal func assignController(controller: ListProtocol) {
        self.controller = controller
    }
    
    internal func loadGames(round: Int) {
        self.controller?.reloadTable()
    }
    
}
