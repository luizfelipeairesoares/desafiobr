//
//  RoundCollectionViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

class RoundCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblRound: UILabel!
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor(red: 59/255, green: 156/255, blue: 0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}

extension RoundCollectionViewCell : BaseCollectionViewCellProtocol {
    
    func configureCell(object: Any?) {
        if let round = object as? Int {
            self.lblRound.text = "Rodada \(round)"
        }
    }
    
}
