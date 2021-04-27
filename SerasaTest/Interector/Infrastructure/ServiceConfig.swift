//
//  ServiceConfig.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation

enum RequestError {
    case ServiceNotFound
    case ErrorRequest
    case NotContent
    case GenericError(statusCode: Int)
    case URLError
}

class ServiceConfig {
    
     
    private static let configuration: URLSessionConfiguration = {
         
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
     
    private static let session = URLSession(configuration: configuration)
    private static let publicKey = "d71283ae5a4486b01787b8ad26ecd0b3"
    private static let privateKey = "ce35d6de0a85fe774491b4ef2e13cd33e58321b4"
    
    private static func getAPIKey(ts: TimeInterval) -> String {
        let secret = "\(ts)\(privateKey)\(publicKey)"
        return secret.md5
    }
    
    class func requestGetAPI(route: Route,
                             onComplete:@escaping (Data?) -> Void,
                             onError:@escaping (RequestError) -> Void) {
        
        let basePath = "https://gateway.marvel.com/"
        let ts = NSDate().timeIntervalSince1970
//        https://gateway.marvel.com/v1/public/characters?ts=1619376319&apikey=d71283ae5a4486b01787b8ad26ecd0b3&hash=3b2bcfdeec15287910fd83b1b7fc122b
//         "https://gateway.marvel.com/v1/public/characters?ts=1619387400.4250422&apikey=d71283ae5a4486b01787b8ad26ecd0b3&hash=3e36ce79a9017bae641e77c394f6143d"

        let completePath = "\(basePath)\(route.value)?ts=\(ts)&apikey=\(publicKey)&hash=\(getAPIKey(ts: ts))"
        guard let url = URL(string: completePath) else {
            onError(.URLError)
            return
        }
         
         let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
             
             if error == nil {
                 guard let response = response as? HTTPURLResponse else {
                     onError(.NotContent)
                     return}
                 
                 if response.statusCode == 200{
                    guard let data = data else {
                        onError(.NotContent)
                        return
                    }
                    onComplete(data)
                 } else {
                    onError(.GenericError(statusCode: response.statusCode))
                 }
             } else {
                onError(.GenericError(statusCode: 502))
                print(error?.localizedDescription ?? String())
             }
             
         }
         dataTask.resume()
     }
     
 }
