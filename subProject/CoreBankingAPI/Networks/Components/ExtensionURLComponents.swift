//
//  ExtensionURLComponents.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.

import Foundation

extension URLComponents {
    init?(endPoint: EndPoint) {
        guard let url = URL(string: Constant.Endpoints.baseUrlBeeceptor) else { return nil }
        
        let fullURL = url.appendingPathComponent(endPoint.path)
        
        self.init(url: fullURL, resolvingAgainstBaseURL: false)
        
        if let parameters = endPoint.parameters {
            queryItems = parameters.map({ key, value in
                return URLQueryItem(name: key, value: String(describing: value))
            })
        }
    }
}
