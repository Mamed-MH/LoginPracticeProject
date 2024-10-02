//
//  ViewController.swift
//  LoginPractice
//
//  Created by Mamed Hacıyev on 16.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var usernameError: UILabel!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var numberTf: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var numberError: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var girisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
        
        usernameTf.delegate = self
    }
    
    func reset() {
        
        loginButton.isEnabled = false
        
        emailError.isHidden = true
        passwordError.isHidden = true
        numberError.isHidden = true
        usernameError.isHidden = true
        girisLabel.isHidden = false
        
        emailError.text = "Error"
        passwordError.text = "Error"
        numberError.text = "Error"
        
        emailTf.text = ""
        passwordTf.text = ""
        numberTf.text = ""
        usernameTf.text = ""
    }

    @IBAction func loginClicked(_ sender: Any) {
        
        reset()
    }
    
    func validateLogin() {
        
    }

    @IBAction func emailChanged(_ sender: Any) {
        
        if let email = emailTf.text {
            
            
            if let errorMessage = invalidetEmail(email) {
                emailError.text = errorMessage
                emailError.isHidden = false
            } else {
                emailError.isHidden = true
            }
        }
        
        
        checkForValidForm()
    }
    
    
    @IBAction func usernameChanged(_ sender: Any) {
        
        
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        
        if let password = passwordTf.text {
            if invalidetPassword(password) {
                
                passwordError.text = "Invalid password"
                passwordError.isHidden = false
                
            } else {
                passwordError.isHidden = true
            }
        }
        
        checkForValidForm()
        
    }
    
    @IBAction func numberChanged(_ sender: Any) {
        
        if let phoneNumber = numberTf.text {
            if let errorMessage = invalidetPhoneNumber(phoneNumber) {
                numberError.text = errorMessage
                numberError.isHidden = false
            } else {
                numberError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidetPhoneNumber(_ value:String) ->String? {
        
        let set = CharacterSet(charactersIn: value)
        
        if CharacterSet.decimalDigits.isSuperset(of: set) {
            
            return "Phone Number must contain only"
        }
        
        if value.count != 8 {
            return "Phone number"
        }
        
        return nil
    }
    
    func  checkForValidForm() {
        
        
        if emailError.isHidden && passwordError.isHidden && numberError.isHidden {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    func invalidetEmail(_ value:String) ->String? {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !predicate.evaluate(with: value) {
            
            return "Invalid Email Adress"
        }
        
        return nil
    }
    
    
    func invalidetPassword(_ value:String) -> Bool {

        let regex = "^(055|077|051|050)\\d{7}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return !predicate.evaluate(with: numberTf.text)
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}

