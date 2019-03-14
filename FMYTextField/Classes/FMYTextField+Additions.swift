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
    case telephone
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
        case .telephone:
            return try validatePhone()
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
        if currentValueIsEmpty() { throw ValidationError("El correo electrónico es requerido") }
        if regularExpresion == nil {
            regularExpresion = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        }
        if validationErrorMessage == nil {
            validationErrorMessage = "El correo electrónico no tiene un formato valido"
        }
        let emailTest = NSPredicate(format:"SELF MATCHES %@", self.regularExpresion!)
        let result = emailTest.evaluate(with: self.text)
        if !result {
            throw ValidationError(validationErrorMessage!)
        }
    }
    
    private func validatePassword() throws {
        if currentValueIsEmpty() { throw ValidationError("La contraseña es requerida") }
        do {
            if regularExpresion == nil {
                regularExpresion = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
            }
            if validationErrorMessage == nil {
                validationErrorMessage = "La contraseña debe tener más de 6 caracteres, con al menos un carácter y un carácter numérico"
            }
            if try NSRegularExpression(pattern: regularExpresion!,  options: .caseInsensitive).firstMatch(in: text!, options: [], range: NSRange(location: 0, length: text!.count)) == nil {
                throw ValidationError(validationErrorMessage!)
            }
        } catch {
            throw ValidationError(validationErrorMessage!)
        }
    }
    
    private func validatePhone() throws {
        if currentValueIsEmpty() { throw ValidationError("El número telefónico es requerido")}
        if regularExpresion == nil {
            regularExpresion = "^[0-9]{10}$"
        }
        if validationErrorMessage == nil {
            validationErrorMessage = "El número telefónico debe de ser de 10 digitos numéricos"
        }
        guard text!.range(of: regularExpresion!, options: .regularExpression) != nil else {
            throw ValidationError(validationErrorMessage!)
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
    
    func currentValueIsEmpty() -> Bool {
        return text == nil || text!.isEmpty
    }
}
