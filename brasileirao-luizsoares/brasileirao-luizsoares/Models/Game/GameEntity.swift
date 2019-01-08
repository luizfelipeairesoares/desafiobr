//
//  GameEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct GameEntity: APICodable {
    
    var gameID:             Int
    var date:               String
    var time:               String
    var homeScore:          Int
    var awayScore:          Int
    var homePenaltiesScore: Int?
    var awayPenaltiesScore: Int?
    var teams:              [String : TeamEntity]
    var local:              LocalEntity
    
    enum CodingKeys: String, CodingKey {
        case gameID             = "id"
        case date               = "data_realizacao"
        case time               = "hora_realizacao"
        case homeScore          = "placar_oficial_mandante"
        case awayScore          = "placar_oficial_visitante"
        case homePenaltiesScore = "placar_penaltis_mandante"
        case awayPenaltiesScore = "placar_penaltis_visitante"
        case teams              = "equipes"
        case local              = "sede"
    }
    
    init() {
        self.gameID             = -1
        self.date               = ""
        self.time               = ""
        self.homeScore          = -1
        self.awayScore          = -1
        self.homePenaltiesScore = -1
        self.awayPenaltiesScore = -1
        self.teams              = [:]
        self.local              = LocalEntity()
    }
    
}
