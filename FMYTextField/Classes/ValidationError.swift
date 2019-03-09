//
//  ValidationError.swift
//  FMYTextField
//
//  Created by Freddy Rodrigo Poot May on 3/9/19.
//

import Foundation

public class ValidationError: Error {
    public var message: String
    
    init(_ message: String) { self.message = message }
}
