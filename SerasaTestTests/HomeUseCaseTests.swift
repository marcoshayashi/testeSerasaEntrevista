//
//  SerasaTestTests.swift
//  SerasaTestTests
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import XCTest
@testable import SerasaTest

class HomeUseCaseTests: XCTestCase{

    var usecase = HomeUseCase()
    
    override func setUp() {
        super.setUp()
        self.createList()
    }



    func testValidateCollectionnViewListsize() throws {
        usecase.didReceiveCharacterList(list: usecase.allCharacterList)
        
        XCTAssertTrue(usecase.characterListToCollectionView?.count == 5, "validação do tamanho da collectionView")

    }
    
    func testNumberOfLineCollectionView() throws {
        usecase.didReceiveCharacterList(list: usecase.allCharacterList)
        
        XCTAssertTrue(usecase.getNumbersOfLineCollectionView() == 5, "validação do tamanho da collectionView")

    }
    
    func testValidateTableViewListsize() throws {
        usecase.didReceiveCharacterList(list: usecase.allCharacterList)
        
        XCTAssertTrue(usecase.characterListToTableView?.count == 7, "validação do tamanho da tableviewlist")
    }
    
    func testNumbersOfLineTableView() throws {
        usecase.didReceiveCharacterList(list: usecase.allCharacterList)
        
        XCTAssertTrue(usecase.getNumbersOfLineTableView() == 7, "validação do tamanho da tableviewlist")
    }
    
    private func createList() {
        let jsonString = """
        [
            {
               "id":1011334,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":1017100,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":1009144,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":1010699,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },{
               "id":1009146,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":1111,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":11111,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
            }
            },
            {
               "id":22,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":2,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":222,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":2222,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            },
            {
               "id":3,
               "name":"3-D Man",
               "thumbnail":{
                  "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension":"jpg"
                }
            }
        ]
        """
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8) ?? Data()
        let list = try? decoder.decode([Character].self, from: data)
        usecase.allCharacterList = list
    }

}
