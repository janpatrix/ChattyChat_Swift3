//
//  LoginVC.swift
//  ChattyChat
//
//  Created by Patrick Gross on 22/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTextfield: RoundTextField!
    @IBOutlet weak var emailTextfield: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text, (email.characters.count > 0 && password.characters.count > 0 ) {
            
            AuthService.instance.login(email: email, password: password, onComplete: { (errMsg, data) in
                
                guard errMsg == nil else {
                    
                    self.presentErrorMsg(title: "Error authenticating", message: errMsg!)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "showCameraVC", sender: nil)
            })
        } else {
            
            self.presentErrorMsg(title: "Username and password required", message: "You must enter a username and a password")
        }
    }
    
    func presentErrorMsg(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
