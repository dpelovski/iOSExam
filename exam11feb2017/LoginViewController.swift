//
//  LoginViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        //validate the username field, if its not correct display error
        guard usernameTextField.text!.characters.count > 2 else {
            let alert = UIAlertController.init(title: "Error", message: "Username should be atleast 3 characters long", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        //validate the password field
        guard passwordTextField.text!.characters.count > 2 else {
            let alert = UIAlertController.init(title: "Error", message: "Password should be atleast 3 characters long", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        DBRequester.instance.login(with: self.usernameTextField.text!, password: self.passwordTextField.text!) { (success) in
            
            
            
            if success {
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "LoginSuccessful", sender: nil)
                }
                
                UserDefaults.standard.set(self.usernameTextField.text, forKey: "username")
                UserDefaults.standard.set(self.passwordTextField.text, forKey: "password")
                UserDefaults.standard.set(true, forKey: "autoLogin")
                
                
            }
            else {
                
                let alert = UIAlertController.init(title: "Error", message: "Wrong username or password", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
        }
        
    }

}
