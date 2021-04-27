//
//  HomeViewModel.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel: HomeViewModelProtocol, UseCaseToViewModelDelegate {
    
    var usecase: HomeUseCase?
    
    init() {
        self.usecase = HomeUseCase()
        self.usecase?.delegate = self
    }
    
    weak var delegate: ViewModelToControllerDelegate?
    
    func getMarvelCharacters(){
        self.usecase?.getMarvelCharacters()
    }
    
    func getNumbersOfLineTableView() -> Int {
        self.usecase?.getNumbersOfLineTableView() ?? 0
    }
    
    func getNumbersOflineCollectionView() -> Int {
        self.usecase?.getNumbersOfLineCollectionView() ?? 0
    }
    
    func didReceiveCharacterList() {
        self.delegate?.didReceiveCharacterList()
    }
    
    func makeTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell
        cell?.prepare(character: usecase?.characterListToTableView?[indexPath.row])
                      
        return cell ?? UITableViewCell()
    }
    
    func makeCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as? CharacterCollectionViewCell
        cell?.prepare(character: usecase?.characterListToCollectionView?[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
      
}
 
protocol HomeUseCaseProtocol {
    func getMarvelCharacters()
    func getNumbersOfLineCollectionView() -> Int
    func getNumbersOfLineTableView() -> Int
}

protocol ViewModelToControllerDelegate: class {
    func didReceiveCharacterList()
}



