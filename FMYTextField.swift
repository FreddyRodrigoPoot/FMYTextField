//
//  FMYTextField.swift
//  EntregasInmobilia
//
//  Created by Freddy Poot on 08/03/19.
//  Copyright © 2019 DaCodes_iOS. All rights reserved.
//

import UIKit

public class FMYTextField: UITextField {
    
    open var validationErrorMessage: String?
    open var validatorType: ValidatorType = ValidatorType.none
    
    /// Este parametro se utiliza para validar la dimensión de la contraseña por defecto es 6
    open var minimunCharactersForPassword: Int = 6
    
    let defaultPlaceHolder = "Existe un campo vacío"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

}