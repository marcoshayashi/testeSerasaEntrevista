//
//  ImageRoutes.swift
//  SerasaTest
//
//  Created by marcos hayashi on 26/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation

enum ImageRoute {
    
    case portrait_small(path: String, format:String)
    case portrait_medium(path: String, format:String)
    case portrait_xlarge(path: String, format:String)
    
    var value: String {
        switch self {
        case .portrait_small(let path, let format):
            return "\(path)/portrait_small.\(format)"
        case .portrait_medium(let path, let format):
            return "\(path)/portrait_medium.\(format)"
        case .portrait_xlarge(let path, let format):
            return "\(path)/portrait_xlarge.\(format)"
        }
    }
    
}
