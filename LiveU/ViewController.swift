//
//  ViewController.swift
//  LiveU
//
//  Created by Eric Sharkey on 9/4/18.
//  Copyright © 2018 Eric Sharkey. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    private var ref: DatabaseReference!
    @IBOutlet weak var mainBackground: UIImageView!
    @IBOutlet weak var liveIcon: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var emailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        logInButton.layer.cornerRadius = 0.5
        mainBackground.image = #imageLiteral(resourceName: "MainBackground")
        liveIcon.image = #imageLiteral(resourceName: "LiveUIcon")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let user = result{
                print("user \(user) found")
                
                self.emailTextField.text = nil
                self.passwordTextField.text = nil
                
            } else {
                if let err = error{
                    print(err)
                }
            }
        }
    }
}

