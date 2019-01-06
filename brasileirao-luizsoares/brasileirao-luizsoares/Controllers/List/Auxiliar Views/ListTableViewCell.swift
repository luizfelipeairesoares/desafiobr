//
//  ListTableViewCell.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

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
        
        self.lblDateTime.text = "SÁB 01/12/2018 MARACANÃ 19:00"
        self.lblHomeTeam.text = "FLA"
        self.lblHomeScore.text = "1"
        self.lblAwayScore.text = "2"
        self.lblAwayTeam.text = "CAP"
    }
    
}
