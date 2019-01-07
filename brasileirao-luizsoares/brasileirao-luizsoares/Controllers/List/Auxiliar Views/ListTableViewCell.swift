//
//  ListTableViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblDateTime:     UILabel!
    @IBOutlet weak var lblHomeTeam:     UILabel!
    @IBOutlet weak var imgHomeTeam:     UIImageView!
    @IBOutlet weak var lblHomeScore:    UILabel!
    @IBOutlet weak var lblAwayScore:    UILabel!
    @IBOutlet weak var imgAwayTeam:     UIImageView!
    @IBOutlet weak var lblAwayTeam:     UILabel!
    
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

extension ListTableViewCell : BaseTableViewCellProtocol {
    
    func configureCell(object: Any?) {
        if let game = object as? GameEntity {
            let home = game.teams["mandante"]
            let away = game.teams["visitante"]
            
            let date: NSAttributedString = NSAttributedString(string: game.date.formatAPIDate()!,
                                                              attributes: [NSAttributedString.Key.font  : UIFont.boldSystemFont(ofSize: 14.0),
                                                                           NSAttributedString.Key.foregroundColor   : UIColor.black])
            let local: NSAttributedString = NSAttributedString(string: game.local.name,
                                                               attributes: [NSAttributedString.Key.font  : UIFont.systemFont(ofSize: 14.0),
                                                                            NSAttributedString.Key.foregroundColor   : UIColor.darkGray])
            let time: NSAttributedString = NSAttributedString(string: game.time,
                                                              attributes: [NSAttributedString.Key.font  : UIFont.boldSystemFont(ofSize: 14.0),
                                                                           NSAttributedString.Key.foregroundColor   : UIColor.black])
            let dateTime = NSMutableAttributedString(string: "")
            dateTime.append(date)
            dateTime.append(NSAttributedString(string: "  "))
            dateTime.append(local)
            dateTime.append(NSAttributedString(string: "  "))
            dateTime.append(time)
            
            self.lblDateTime.attributedText = dateTime
            
            self.lblHomeTeam.text = home?.initials
            self.lblHomeScore.text = "\(game.homeScore)"
            self.imgHomeTeam.kf.setImage(with: URL(string: home!.shieldURL)!, placeholder: UIImage(named: "shield"))
            
            self.lblAwayScore.text = "\(game.awayScore)"
            self.lblAwayTeam.text = away?.initials
            self.imgAwayTeam.kf.setImage(with: URL(string: away!.shieldURL)!, placeholder: UIImage(named: "shield"))
        }
    }
    
}
