//
//  ViewController.swift
//  FMYTextField
//
//  Created by Freddy R. Poot May on 03/09/2019.
//  Copyright (c) 2019 Freddy R. Poot May. All rights reserved.
//

import UIKit
import FMYTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: FMYTextField! {
        didSet {
            textField.validatorType = .email
            validate()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validate() {
        do {
            try textField.validated()
        } catch (let error) {
            print((error as! ValidationError).message)
        }
    }

}

