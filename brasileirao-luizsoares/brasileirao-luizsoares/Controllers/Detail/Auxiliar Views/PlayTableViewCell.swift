//
//  PlayTableViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

class PlayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPlay: UILabel!
    
    // MARK: - Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension PlayTableViewCell : BaseTableViewCellProtocol {
    
    func configureCell(object: Any?) {
        if let gameplay = object as? GameplayEntity {
            if let bodyText = gameplay.body.block.first?.text {
                self.lblPlay.text = bodyText
            }
            if gameplay.title.isEmpty == false {
                self.lblTitle.text = gameplay.title
            } else if gameplay.playType.isEmpty == false {
                self.lblTitle.text = gameplay.playType
            }
        }
    }
    
}
