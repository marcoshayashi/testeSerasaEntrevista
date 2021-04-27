//
//  ViewController.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewModelToControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.viewModel.delegate = self
        self.viewModel.getMarvelCharacters()
    }
    
    private func setupView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func didReceiveCharacterList() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
    }
    
}


protocol HomeViewModelProtocol {
    func getMarvelCharacters()
    func getNumbersOflineCollectionView() -> Int
    func getNumbersOfLineTableView() -> Int 
    func makeTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func makeCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
