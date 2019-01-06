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
    
    fileprivate var round: RoundEntity? = nil
    
    // MARK: - Functions
    
    internal func assignController(controller: ListProtocol) {
        self.controller = controller
    }
    
    internal func loadRounds() {
        GamesService().requestRounds { (apiresult) in
            switch apiresult {
            case .success(let round):
                self.round = round
                DispatchQueue.main.async {
                    self.loadGames(round: self.round!.current)
                }
            case .failure(let error):
                self.controller?.showError(errorMsg: error["message"]!)
            }
        }
    }
    
    internal func loadGames(round: Int) {
        
        //self.controller?.reloadTable()
    }
    
}
