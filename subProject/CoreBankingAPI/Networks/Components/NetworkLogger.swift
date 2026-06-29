//
//  NetworkLogger.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//


import Foundation

final class NetworkLogger {

    func debugNetworkLog(
        url: String?,
        data: Data?,
        response: URLResponse?,
        headers: Headers,
        body: Any?,
        error: Error?
    ) {

        
        #if DEBUG
        print("\n🟣🟣🟣==================== NETWORK LOG ====================🟣🟣🟣\n")

        // 🔗 URL
        print("🔗 URL:\n➡️ \(url ?? "N/A")\n")

        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            let statusEmoji = (200...299).contains(statusCode) ? "✅ Success" : "❌ Failure"
            print("📥 STATUS CODE:\n\(statusEmoji) (\(statusCode))\n")
        } else {
            print("📥 STATUS CODE:\n⚪ N/A (Unknown)\n")
        }

        // 📦 Request Body
        print("📦 REQUEST BODY:")
        if let body {
            print("✏️ \(body)\n")
        } else {
            print("⚪ No Body\n")
        }

        // 🧾 Request Headers
        print("🧾 REQUEST HEADERS:")
        if headers.isEmpty {
            print("⚪ No Headers\n")
        } else {
            for (key, value) in headers {
                print("🔹 \(key): \(value)")
            }
            print()
        }

        // 📬 Response Body
        print("📬 RESPONSE BODY:")
        let responseString = String(data: data ?? Data(), encoding: .utf8) ?? "⚪ No Response"
        print("📝 \(responseString)\n")

        // ❌ Error
        if let error {
            print("❌ ERROR:\n⚠️ \(error.localizedDescription)\n")
        }

        print("🟣🟣🟣==================== END LOG =====================🟣🟣🟣\n")
        
        #endif
    }
}
