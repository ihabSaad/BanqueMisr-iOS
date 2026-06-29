//
//  NetworkManger.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.


import Foundation

final class NetworkManager {
    
    
    private var task: URLSessionDataTask? = nil
    private let networkLogger = NetworkLogger()
    
    func request<T: Codable>(of type: T.Type, endPoint: EndPoint, completion: @escaping (ResponseStatus<T>) -> Void) {
        
        guard let url = URLComponents(endPoint: endPoint)?.url else {
            print("Invalid URL .....")
            return
        }
        
        var request = URLRequest(url: url, endPoint: endPoint)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        print("🌍 STARTING REQUEST TO: \(url)")

        let currentTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            print("💡💡 GOT RESPONSE FROM SERVER")

                if let error = error {
                    print("❌ 2. NETWORK ERROR: \(error.localizedDescription)")
                    completion(.failure(message: error.localizedDescription))
                    return
                }

                guard let data = data else {
                    print("❌ 3. NO DATA RECEIVED")
                    completion(.failure(message: "No data"))
                    return
                }

                let jsonString = String(data: data, encoding: .utf8) ?? ""
                print("📥 4. RAW DATA FROM SERVER: \(jsonString)")

                do {
                    let decodedData = try JSONDecoder().decode(type, from: data)
                    print("✅ 5. DECODING SUCCESS!")
                    
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                } catch let decodingError {
                    print("❌ 6. DECODING FAILED: \(decodingError)")
                    DispatchQueue.main.async {
                        completion(.failure(message: "Decoding error"))
                    }
                }
            }
        currentTask.resume()
    }
    private func logNetworkRequest(task: URLSessionDataTask?, data: Data?, response: URLResponse?, body: Any?, error: Error?) {
        let url: String = task?.originalRequest?.url?.absoluteString ?? ""
        let headers: Headers = task?.originalRequest?.allHTTPHeaderFields ?? [:]
        let responseBody = String(data: data ?? Data(), encoding: .utf8) ?? ""
        let statusCode: Int = (task?.response as? HTTPURLResponse)?.statusCode ?? 0

        networkLogger.debugNetworkLog(url: url, data: data,response: response, headers: headers, body: body, error: error
        )
    }
}





