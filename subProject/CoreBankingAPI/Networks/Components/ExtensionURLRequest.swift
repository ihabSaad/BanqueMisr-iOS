//
//  ExtensionURLRequest.swift
//  Banque Misr
//
//  Created by ihab saad on 19/02/2026.
//

import Foundation
import MOLH

extension URLRequest {
    
    // MARK: - Request
    init(url: URL, endPoint: EndPoint) {
        self.init(url: url, timeoutInterval: Constant.Endpoints.timeout)
        httpMethod = endPoint.requestMethod.rawValue
        
        // Default Headers
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        addValue("application/json", forHTTPHeaderField: "Accept")
        addValue("iOS", forHTTPHeaderField: "Platform")
        addValue("$2a$10$PJxXcbaQlWWlzXoEk0TxIeXd6IWUbsDome10MbYe7WeqvmYfAU2eC", forHTTPHeaderField: "X-Master-Key")
        
        let currentLanguage = MOLHLanguage.currentAppleLanguage()
        addValue(currentLanguage, forHTTPHeaderField: "lang")
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            addValue(version, forHTTPHeaderField: "version")
        }

        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            addValue(build, forHTTPHeaderField: "build-Number")
        }

        // Custom Headers
        endPoint.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
 
        addValue("MyNewUser", forHTTPHeaderField: "X-Bin-Name")

        
        // POST/PUT/PATCH)
        if let body = endPoint.body {
            if let encodableBody = body as? Encodable {
                if let dictionary = encodableBody.asDictionary() {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                        httpBody = jsonData
                        print("🚀 FINAL JSON BODY: \(String(data: jsonData, encoding: .utf8) ?? "")")
                    } catch {
                        print("❌ Serialization Error: \(error)")
                    }
                }
            }
        }
    }
}
