//
//  LogInViewController.swift
//  LoginScreen
//
//  Created by Ant Colony on 3. 11. 2021..
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var emailToBeSent: String = ""
    
    @IBAction func logIn (_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if !isValidEmail(email) {
            invalidEmailAlert()
            return
        }
        
        if password.count < 5 {
            invalidPasswordAlert()
            return
        }
        
        if !areCredentialsOK(email: email, password: password) {
            invalidCredentialsAlert()
            return
        }
        
        if areCredentialsOK(email: email, password: password) {
            emailToBeSent = email
            performSegue(withIdentifier: "ShowEmailSegue", sender: email)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EmailViewController {
                let vc = segue.destination as? EmailViewController
                vc?.email = emailToBeSent
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func invalidEmailAlert() {
        let alert = UIAlertController(title: "Invalid Email Credentials", message: "Please fill out all the fields correctly", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action
            in
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func invalidPasswordAlert() {
        let alert = UIAlertController(title: "Invalid Password Credentials", message: "The password must be at least 5 characters!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action
            in
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func invalidCredentialsAlert() {
        let alert = UIAlertController(title: "Invalid Credentials", message: "Please type in correct username and password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action
            in
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func areCredentialsOK(email: String, password: String) -> Bool {
        return email == "test@antcolony.io" && password == "Tutorial"
    }
    
    

}

