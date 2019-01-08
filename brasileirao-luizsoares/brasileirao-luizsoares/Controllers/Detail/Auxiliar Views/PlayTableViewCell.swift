//
//  PlayTableViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

class PlayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMinute: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPlay: UILabel!
    
    // MARK: - Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.lblMinute.layer.cornerRadius = self.lblMinute.frame.height / 2
        self.lblMinute.layer.masksToBounds = true
        self.lblMinute.backgroundColor = .darkGray
        self.lblMinute.textColor = .white
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.img.image = nil
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
            
            self.lblTitle.text = gameplay.playType.rawValue
            switch gameplay.playType {
            case .sub:
                self.img.image = UIImage(named: "sub")
                break
            case .red:
                self.lblTitle.text = "CARTÃO VERMELHO"
                self.img.image = UIImage(named: "card_red")
                break
            case .yellow:
                self.lblTitle.text = "CARTÃO AMARELO"
                self.img.image = UIImage(named: "card_yellow")
                break
            case .goal:
                self.img.image = UIImage(named: "goal")
                break
            case .important:
                self.img.image = UIImage(named: "important")
                break
            case .normal:
                self.img.image = nil
                break
            }
            
            if gameplay.title.isEmpty == false {
                self.lblTitle.text = gameplay.title
            }
            
            if let minute = gameplay.moment.convertGameplayMoment() {
                self.lblMinute.text = minute + "'"
            } else {
                self.lblMinute.text = "   "
            }
        }
    }
    
}
