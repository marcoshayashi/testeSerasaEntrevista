//
//  RepositoryTest.swift
//  SerasaTestTests
//
//  Created by marcos hayashi on 27/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import XCTest
@testable import SerasaTest

class RepositoryTest: XCTestCase, RepositoryToUseCaseDelegate {
    
    
    var expectation: XCTestExpectation?

    var repository: HomeRepository?
    
    override func setUp() {
        super.setUp()
        repository = HomeRepository()
        repository?.delegate = self
    }


    func testGetMarvelRepository() throws {
        repository?.getMarvelCharacters()
        expectation = expectation(description: "chamada do serviço da marvel")
        waitForExpectations(timeout: 20)
    }
    
    func didReceiveCharacterList(list: [Character]?) {
        XCTAssertNotNil(list)
        expectation?.fulfill()
        expectation = nil
        
    }
}
