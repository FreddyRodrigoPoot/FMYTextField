//
//  FMYTextField+Additions.swift
//  FMYTextField
//
//  Created by Freddy Rodrigo Poot May on 3/9/19.
//

import Foundation

public enum ValidatorType {
    case email
    case password
    case required
    case none
}

extension FMYTextField {
    
    open func validated() throws {
        switch validatorType {
        case .email:
            return try validateEmail()
        case .password:
            return try validatePassword()
        case .required:
            return try requiredValidation()
        case .none:
            return
        }
    }
    
    private func requiredValidation() throws {
        if text == nil || text!.isEmpty {
            throw ValidationError(throwMessage)
        }
    }
    
    private func validateEmail() throws {
        if text == nil || text!.isEmpty {
            throw ValidationError("El correo electrónico es requerido")
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self.text)
        if !result {
            throw ValidationError(throwMessage)
        }
    }
    
    private func validatePassword() throws {
        guard text != nil else { throw ValidationError("La contraseña es requerido") }
        guard text!.count >= self.minimunCharactersForPassword else { throw ValidationError("La contraseña debe tener al menos \(minimunCharactersForPassword) caracteres") }
        do {
            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",  options: .caseInsensitive).firstMatch(in: text!, options: [], range: NSRange(location: 0, length: text!.count)) == nil {
                throw ValidationError("La contraseña debe tener más de 6 caracteres, con al menos un carácter y un carácter numérico")
            }
        } catch {
            throw ValidationError("La contraseña debe tener más de 6 caracteres, con al menos un carácter y un carácter numérico")
        }
    }
    
    // Helper functions
    
    var throwMessage: String {
        var message = validationErrorMessage
        if message == nil {
            message = placeholder != nil ? "El campo \(placeholder!) no es valido" : defaultPlaceHolder
        }
        return message!
    }
}
