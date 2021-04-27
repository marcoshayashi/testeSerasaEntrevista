//
//  Character.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation

class ResponseAPICharacter: Codable {
    var data: ResponseData?
    
}

class ResponseData: Codable {
    var count: Int?
    var results: [Character]?
}

class Character: Codable {
    var id: Int?
    var name: String?
    var thumbnail: ThumbnailMavel?
    
}

class ThumbnailMavel: Codable {
    var path: String?
    var format: String?
   
    enum CodingKeys: String, CodingKey {
        case path
        case format = "extension"
    }
}
