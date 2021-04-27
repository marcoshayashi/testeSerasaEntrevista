//
//  HomeRepository.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation

class HomeRepository: HomeRepositryProtocol {
    
    weak var delegate: RepositoryToUseCaseDelegate?
    
    func getMarvelCharacters() {
        ServiceConfig.requestGetAPI(route: .characters,
                                    onComplete: { (data) in
                                        let response = try? JSONDecoder().decode(ResponseAPICharacter.self, from: data ?? Data())
                                        self.delegate?.didReceiveCharacterList(list: response?.data?.results)
                                    }) { (error) in
                                        print(error)
                                    }
    }
    
}

protocol RepositoryToUseCaseDelegate: AnyObject {
    func didReceiveCharacterList(list: [Character]?)
}


