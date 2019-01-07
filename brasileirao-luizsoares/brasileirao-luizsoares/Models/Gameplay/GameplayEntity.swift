//
//  GameplayEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct GameplayEntity: APICodable {
    
    let body:           GameplayBody
    let created:        String
    let moment:         String
    let period:         String
    let periodLabel:    String
    let playType:       String
    let title:          String
    
    enum CodingKeys: String, CodingKey {
        case body           = "corpo"
        case created        = "created"
        case moment         = "momento"
        case period         = "periodo"
        case periodLabel    = "periodoLabel"
        case playType       = "tipoLance"
        case title          = "titulo"
    }
    
}

struct GameplayBlock: APICodable {
    
    let text:       String
    let type:       String
    
    enum CodingKeys: String, CodingKey {
        case text           = "text"
        case type           = "type"
    }
    
}

struct GameplayBody: APICodable {
    
    let block:      [GameplayBlock]
    
    enum CodingKeys: String, CodingKey {
        case block  = "blocks"
    }
    
}
