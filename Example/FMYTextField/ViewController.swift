//
//  ViewController.swift
//  FMYTextField
//
//  Created by Freddy R. Poot May on 03/09/2019.
//  Copyright (c) 2019 Freddy R. Poot May. All rights reserved.
//

import UIKit
import FMYTextField

struct TextFieldValidationType {
    var name: String
    var type: ValidatorType
    var errorMessage: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: FMYTextField! {
        didSet {
            textField.validatorType = .email
            textField.validationErrorMessage = "El formato del correo electrónico es xxxx@xxx.com"
        }
        
    }
    
    var validations = [TextFieldValidationType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        validations.append(TextFieldValidationType(name: "Email", type: .email, errorMessage: "El formato del correo electrónico es xxxx@xxx.com"))
        validations.append(TextFieldValidationType(name: "Contraseña", type: .password, errorMessage: "La contraseña debe ser minimo 6 caracteres"))
        validations.append(TextFieldValidationType(name: "Teléfono", type: .telephone, errorMessage: "El telefono debe ser minimo de 10 digitos"))
        validations.append(TextFieldValidationType(name: "Campo requerido", type: .required, errorMessage: "El campo es requerido"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validate() {
        do {
            try textField.validated()
        } catch (let error) {
            guard let validationError = error as? ValidationError else { return }
            let alert = UIAlertController(title: "Error", message: validationError.message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func validateTextFieldAction() {
        validate()
    }
    
    @IBAction func changeTypeValidation() {
        let actionSheet = UIAlertController(title: "Cambiar el tipo de validación", message: nil, preferredStyle: .actionSheet)
        for validation in self.validations {
            let action = UIAlertAction(title: validation.name, style: .default) { [unowned self] (_) in
                self.textField.validatorType = validation.type
                self.textField.validationErrorMessage = validation.errorMessage
            }
            actionSheet.addAction(action)
        }
        present(actionSheet, animated: true, completion: nil)
    }
}


