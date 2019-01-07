//
//  BaseCollectionViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCollectionViewCellProtocol : class {
    
    static func cellIdentifier() -> String
    
    func configureCell(object: Any?)
    
}

extension BaseCollectionViewCellProtocol where Self : UICollectionViewCell {
    
    static func cellIdentifier() -> String {
        return "\(self)Identifier"
    }
    
}
