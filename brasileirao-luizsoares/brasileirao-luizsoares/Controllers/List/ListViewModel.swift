//
//  ListViewModel.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

protocol ListProtocol : ControllerProtocol {
    
    func reloadCollection()
    func reloadTable()
    
}

class ListViewModel {
    
    // MARK: - Variables
    
    fileprivate weak var controller: ListProtocol?
    
    internal var games: [GameEntity] = []
    
    internal var round: RoundEntity? = nil
    
    internal var selectedRound: Int = 1
    
    // MARK: - Functions
    
    internal func assignController(controller: ListProtocol) {
        self.controller = controller
    }
    
    internal func loadRounds() {
        self.controller?.showLoading()
        GamesService().requestRounds { [weak self] (apiresult) in
            switch apiresult {
            case .success(let round):
                self?.round = round
                DispatchQueue.main.async {
                    self?.loadGames(round: self!.round!.current)
                    self?.controller?.reloadCollection()
                }
            case .failure(let error):
                self?.controller?.showError(errorMsg: error["message"]!)
            }
        }
    }
    
    internal func loadGames(round: Int) {
        self.controller?.showLoading()
        self.selectedRound = round
        GamesService().requestGames(round: round) { [weak self] (apiresult) in
            switch apiresult {
            case .success(let games):
                self?.games.removeAll()
                self?.games.append(contentsOf: games)
                self?.controller?.reloadTable()
            case .failure(let error):
                self?.controller?.showError(errorMsg: error["message"]!)
            }
        }
    }
    
}
