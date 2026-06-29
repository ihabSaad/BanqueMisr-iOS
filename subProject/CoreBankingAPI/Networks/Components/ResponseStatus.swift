//
//  ResponseStatus.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import Foundation

public enum ResponseStatus<T: Codable>{
            case success(T)
            case failure(message:String)
}
