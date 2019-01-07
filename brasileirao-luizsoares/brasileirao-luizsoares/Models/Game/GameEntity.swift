//
//  GameEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct GameEntity: APICodable {
    
    let date:               String
    let time:               String
    let homeScore:          Int
    let awayScore:          Int
    let homePenaltiesScore: Int?
    let awayPenaltiesScore: Int?
    let teams:              [String : TeamEntity]
    let local:              LocalEntity
    
    enum CodingKeys: String, CodingKey {
        case date               = "data_realizacao"
        case time               = "hora_realizacao"
        case homeScore          = "placar_oficial_mandante"
        case awayScore          = "placar_oficial_visitante"
        case homePenaltiesScore = "placar_penaltis_mandante"
        case awayPenaltiesScore = "placar_penaltis_visitante"
        case teams              = "equipes"
        case local              = "sede"
        
    }
    
}
