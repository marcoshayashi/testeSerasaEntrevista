//
//  HomeUseCase.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation


class HomeUseCase: HomeUseCaseProtocol, RepositoryToUseCaseDelegate {
 

    var allCharacterList: [Character]?
    var characterListToCollectionView: [Character]?
    var characterListToTableView: [Character]?
    
    var cacheIds = [1011334, 1017100, 1009144, 1010699, 1009146]
    
    weak var delegate: UseCaseToViewModelDelegate?
    
    var repository: HomeRepository?
    
    init() {
        repository = HomeRepository()
        repository?.delegate = self
    }
    
    func getMarvelCharacters() {
        repository?.getMarvelCharacters()
    }
    
    func getNumbersOfLineCollectionView() -> Int {
        return self.characterListToCollectionView?.count ?? 0
    }
    
    func getNumbersOfLineTableView() -> Int {
        return self.characterListToTableView?.count ?? 0
    }
    
    func didReceiveCharacterList(list: [Character]?) {
        self.allCharacterList = list
        self.characterListToCollectionView = allCharacterList?.filter({ cacheIds.contains($0.id ?? 0) })
        self.characterListToTableView = allCharacterList?.filter({ !cacheIds.contains($0.id ?? 0) })
        delegate?.didReceiveCharacterList()
    }
    
}

protocol UseCaseToViewModelDelegate: class {
    func didReceiveCharacterList()
}

protocol HomeRepositryProtocol {
    func getMarvelCharacters()
}
