//
//  EndPoint.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import Foundation


typealias Headers = [String: String]
typealias Parameters = [String: Any]

public struct EndPoint {
    
    var path: String
    var requestMethod: HttpMethod
    var parameters: Parameters?
    var headers: Headers?
    var body: Any?
    
  init(path: String,
         httpMethod: HttpMethod,
         parameters: Parameters? = nil,
         headers: Headers? = nil,
         body: Any? = nil) {
        
        self.path = path
        self.requestMethod = httpMethod
        self.parameters = parameters
        self.headers = headers
        self.body = body
    }
}


