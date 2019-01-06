//
//  BaseTableViewCellProtocol.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCellProtocol : class {
    
    static func cellIdentifier() -> String
    
    func configureCell(object: Any?)
    
}

extension BaseTableViewCellProtocol where Self : UITableViewCell {
    
    static func cellIdentifier() -> String {
        return "\(self)Identifier"
    }
    
}
