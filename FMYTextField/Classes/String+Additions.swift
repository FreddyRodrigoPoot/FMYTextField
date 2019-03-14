//
//  String+Additions.swift
//  FMYTextField
//
//  Created by Freddy Rodrigo Poot May on 3/11/19.
//

import Foundation

extension String {
    func evaluateWithRegularExpresion(_ expresion: String) -> Bool{
        return range(of: expresion, options: .regularExpression) != nil
    }
}
