//
//  Route.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation

enum Route {
    
    case characters
    
    var value: String {
        switch self {
        case .characters:
            return "v1/public/characters"
        }
    }
    
}


