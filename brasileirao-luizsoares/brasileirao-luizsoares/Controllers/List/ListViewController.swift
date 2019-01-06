//
//  ListViewController.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    
    fileprivate var viewModel: ListViewModel = ListViewModel()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblView.tableFooterView = UIView(frame: .zero)
        self.tblView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.assignController(controller:  self)
        self.viewModel.loadGames(round: 38)
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

// MARK: - ListViewController UITableViewDataSource

extension ListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.viewModel.games.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier(), for: indexPath) as! ListTableViewCell
        //cell.configureCell(object: self.viewModel.games[indexPath.row])
        cell.configureCell(object: nil)
        return cell
    }
    
}

// MARK: - ListViewController UITableViewDelegate

extension ListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        //let game = self.viewModel.games[indexPath.row]
    }
    
}

// MARK: - ListViewController ListProtocol

extension ListViewController : ListProtocol {
    
    func reloadTable() {
        self.tblView.reloadData()
        self.tblView.isHidden = false
    }
    
}
