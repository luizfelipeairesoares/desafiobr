//
//  DetailViewController.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var lblDateTime:     UILabel!
    @IBOutlet weak var lblHomeTeam:     UILabel!
    @IBOutlet weak var imgHomeTeam:     UIImageView!
    @IBOutlet weak var lblHomeScore:    UILabel!
    @IBOutlet weak var lblAwayScore:    UILabel!
    @IBOutlet weak var imgAwayTeam:     UIImageView!
    @IBOutlet weak var lblAwayTeam:     UILabel!
    @IBOutlet weak var tblView:         UITableView!
    
    fileprivate var viewModel = DetailViewModel()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Detalhe"
        
        self.tblView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.assignController(controller: self)
        
        self.configureGame()
        
        self.viewModel.loadGameplay()
    }
    
    internal func assignGame(game: GameEntity) {
        self.viewModel.currentGame = game
    }
    
    class func storyboardID() -> String {
        return "\(self)StoryboardID"
    }
    
    // MARK: - Auxiliar Functions
    
    fileprivate func configureGame() {
        if let game = self.viewModel.currentGame {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - DetailViewController UITableViewDataSource

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.gameplay.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.gameplay[section].first!.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayTableViewCell.cellIdentifier(), for: indexPath) as! PlayTableViewCell
        let dict = self.viewModel.gameplay[indexPath.section]
        let gameplay = dict.values.first![indexPath.row]
        cell.configureCell(object: gameplay)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel.gameplay[section].keys.first
    }
    
}

// MARK: - DetailViewController UITableViewDelegate

extension DetailViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

// MARK: - DetailViewController DetailProtocol

extension DetailViewController : DetailController {
    
    func reloadTable() {
        self.tblView.reloadData()
        self.hideLoading()
    }
    
}
