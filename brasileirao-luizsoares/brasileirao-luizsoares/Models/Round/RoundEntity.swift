//
//  RoundEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct RoundEntity : APICodable {
    
    var total: Int
    var current: Int
    
    enum CodingKeys: String, CodingKey {
        case total      = "rounds"
        case current    = "current"
    }
    
    init() {
        self.total = 0
        self.current = 0
    }
    
}
