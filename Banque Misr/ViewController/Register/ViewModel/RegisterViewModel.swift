
//  RegisterViewModel.swift
//  Banque Misr
//  Created by ihab saad on 21/02/2026.


import Foundation
import CoreBankingAPI

class RegisterViewModel {
    
    // MARK: - Validation
    
    func validate(
        fullName: String?,
        email: String?,
        password: String?,
        confirmPassword: String?,
        phone: String?
    ) -> String? {
        
        let name = fullName?.trimmed
        let email = email?.trimmed
        let password = password?.trimmed
        let phone = phone?.trimmed

        // Full name check
        guard let name = name, !name.isEmpty else { return "Full name is required" }

        // Email check
        guard let email = email, !email.isEmpty else { return "Email is required" }
        guard isValidEmail(email) else { return "Invalid email format" }

        // Password check
        guard let password = password, !password.isEmpty else { return "Password is required" }
        guard password == confirmPassword else { return "Passwords do not match" }
        guard password.count >= 6 else { return "Password must be at least 6 characters" }

        // Phone check
        if let phone = phone, !phone.isEmpty {
            guard isValidEgyptianPhone(phone) else { return "Invalid Egyptian phone number" }
        }

        return nil
    }
    
    // MARK: - Private helpers
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    private func isValidEgyptianPhone(_ phone: String) -> Bool {
        let phoneRegex = "^(?:\\+20|0)?1[0125][0-9]{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone)
    }
}
