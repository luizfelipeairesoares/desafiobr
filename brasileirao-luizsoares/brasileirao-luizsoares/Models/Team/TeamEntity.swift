//
//  TeamEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct TeamEntity: APICodable {
    
    let shieldURL:      String
    let fullName:       String
    let initials:       String
    
    enum CodingKeys: String, CodingKey {
        case shieldURL      = "escudo"
        case fullName       = "nome_popular"
        case initials       = "sigla"
    }
    
}
