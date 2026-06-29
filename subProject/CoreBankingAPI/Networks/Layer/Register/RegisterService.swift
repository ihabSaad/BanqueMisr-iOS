//
//  RegisterService.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 04/03/2026.
//

import Foundation


public protocol RegisterServiceProtocol {
    func register(
        user: UserRecord,
        completion: @escaping (ResponseStatus<UserRecord>) -> Void
    )
}

public class RegisterService: RegisterServiceProtocol {
    
    private let networkManager = NetworkManager()
    
    public init() {}

    public func register(
        user: UserRecord,
        completion: @escaping (ResponseStatus<UserRecord>) -> Void
    ) {

        let endPoint = EndPoint(
            path: Constant.Paths.registerEndpoint,
            httpMethod: .put,
            body: user
        )
        if let dict = user.asDictionary() {
            print("🚀 Sending JSON: \(dict)")
        }

        networkManager.request(
            of: UserRecord.self,
            endPoint: endPoint,
            completion: completion
        )
    }
}
