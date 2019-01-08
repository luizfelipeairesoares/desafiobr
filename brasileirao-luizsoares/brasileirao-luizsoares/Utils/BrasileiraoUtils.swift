//
//  BrasileiraoUtils.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import UIKit

enum BrasileiraoUtils {
    
    // MARK: - Colors
    enum Colors {
        case green
        
        func color() -> UIColor {
            switch self {
            case .green:
                return UIColor(red: 59/255, green: 156/255, blue: 0, alpha: 1.0)
            }
        }
    }
    
}
