//
//  LocalEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct LocalEntity: APICodable {
    
    let name:   String
    
    enum CodingKeys: String, CodingKey {
        case name   = "nome_popular"
    }
    
}
