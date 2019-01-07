//
//  DetailViewModel.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

protocol DetailController: ControllerProtocol {
    
    func reloadTable()
    
}

class DetailViewModel {
    
    // MARK: - Variables
    
    fileprivate weak var controller: DetailController? = nil
    
    internal var currentGame: GameEntity? = nil
    
    internal var gameplay: [[String : [GameplayEntity]]] = []
    
    // MARK: - Functions
    
    internal func assignController(controller: DetailController) {
        self.controller = controller
    }
    
    fileprivate func organizeGameplay(gameplay: [GameplayEntity]) {
        let grouped = Dictionary.init(grouping: gameplay, by: { $0.period })
        var sorted: [[String : [GameplayEntity]]] = []
        for key in grouped.keys {
            let values = grouped[key]!
            let sort = values.sorted(by: { (entity1, entity2) -> Bool in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                
                if let date1 = dateFormatter.date(from: entity1.created), let date2 = dateFormatter.date(from: entity2.created) {
                    return date1 < date2
                }
                return false
            })
            sorted.append([key : sort])
        }
        var sortedByKey = [[String : [GameplayEntity]]](repeating: [:], count: 5)
        for dict in sorted {
            switch dict.keys.first! {
            case "PRE_JOGO":
                sortedByKey.remove(at: 0)
                sortedByKey.insert(["Pré-Jogo" : dict.values.first!], at: 0)
                break
            case "PRIMEIRO_TEMPO":
                sortedByKey.remove(at: 1)
                sortedByKey.insert(["1º Tempo" : dict.values.first!], at: 1)
                break
            case "INTERVALO":
                sortedByKey.remove(at: 2)
                sortedByKey.insert(["Intervalo" : dict.values.first!], at: 2)
                break
            case "SEGUNDO_TEMPO":
                sortedByKey.remove(at: 3)
                sortedByKey.insert(["2º Tempo" : dict.values.first!], at: 3)
                break
            case "FIM_DE_JOGO":
                sortedByKey.remove(at: 4)
                sortedByKey.insert(["Fim de Jogo" : dict.values.first!], at: 4)
            default:
                break
            }
        }
        for dict in sortedByKey {
            self.gameplay.append(dict)
        }
    }
    
    // MARK: - Requests
    
    internal func loadGameplay() {
        if let gameID = self.currentGame?.gameID {
            self.controller?.showLoading()
            GamesService().requestGameplay(gameID: gameID) { [weak self] (apiresult) in
                switch apiresult {
                case .success(let gameplay):
                    self?.organizeGameplay(gameplay: gameplay)
                    self?.controller?.reloadTable()
                case .failure(let error):
                    self?.controller?.showError(errorMsg: error["message"]!)
                }
            }
        }
    }
    
}
