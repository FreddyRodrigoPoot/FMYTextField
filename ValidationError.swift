//
//  ValidationError.swift
//  EntregasInmobilia
//
//  Created by Freddy Rodrigo Poot May on 3/8/19.
//  Copyright © 2019 DaCodes_iOS. All rights reserved.
//

import Foundation

public class ValidationError: Error {
    public var message: String
    
    init(_ message: String) { self.message = message }
}



