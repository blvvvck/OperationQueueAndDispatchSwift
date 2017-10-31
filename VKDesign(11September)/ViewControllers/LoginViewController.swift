//
//  LoginViewController.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 30/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let loginSegueIdentifier = "loginSeque"
    @IBOutlet weak var errorLabel: UILabel!
    let errorMessage = "Заполните все поля"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        if (passwordTextField.text == "admin" && emailTextField.text == "admin") {
            performSegue(withIdentifier: loginSegueIdentifier, sender: nil)
        } else if let user = UserRepository.sharedInstance.get() {
            if (passwordTextField.text == user.password && user.email == emailTextField.text) {
                performSegue(withIdentifier: loginSegueIdentifier, sender: nil)
            }
        }
        else {
            errorLabel.text = errorMessage
        }
    }
}
