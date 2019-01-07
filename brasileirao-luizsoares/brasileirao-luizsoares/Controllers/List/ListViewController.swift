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
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var viewModel: ListViewModel = ListViewModel()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblView.tableFooterView = UIView(frame: .zero)
        self.tblView.isHidden = true
        self.collectionView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.assignController(controller:  self)
        
        self.viewModel.loadRounds()
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
        return self.viewModel.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier(), for: indexPath) as! ListTableViewCell
        cell.configureCell(object: self.viewModel.games[indexPath.row])
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

// MARK: - ListViewController UICollectionViewDataSource

extension ListViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.round?.total ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundCollectionViewCell.cellIdentifier(), for: indexPath) as! RoundCollectionViewCell
        cell.configureCell(object: indexPath.row+1)
        if self.viewModel.selectedRound == indexPath.row+1 {
            cell.lblRound.font = UIFont.boldSystemFont(ofSize: 17.0)
        } else {
            cell.lblRound.font = UIFont.systemFont(ofSize: 14.0)
        }
        return cell
    }
    
}

// MARK: - ListViewController UICollectionViewDelegate

extension ListViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        self.viewModel.loadGames(round: indexPath.row+1)
        
        self.tblView.isHidden = true
        
        let selectedIdx = IndexPath(row: self.viewModel.selectedRound-1, section: 0)
        self.collectionView.scrollToItem(at: selectedIdx, at: .centeredHorizontally, animated: true)
        collectionView.reloadData()
    }
    
}

// MARK: - ListViewController ListProtocol

extension ListViewController : ListProtocol {
    
    func reloadCollection() {
        self.collectionView.reloadData()
        self.collectionView.isHidden = false
        
        let selectedIdx = IndexPath(row: self.viewModel.selectedRound-1, section: 0)
        self.collectionView.scrollToItem(at: selectedIdx, at: .centeredHorizontally, animated: true)
    }
    
    func reloadTable() {
        self.tblView.reloadData()
        self.tblView.isHidden = false
        self.hideLoading()
    }
    
}
