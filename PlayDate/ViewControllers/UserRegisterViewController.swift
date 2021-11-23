//
//  UserRegisterViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit
import Firebase
import FirebaseAuth

// Will make pretty soon!
class UserRegisterViewController: UIViewController {
    
    
    private let registerLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Register"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address"
        field.layer.borderWidth = 1
        return field
    }()
    
    private let passField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.isSecureTextEntry = true
        return field
    }()
    
    private let pass2Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm Password"
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.isSecureTextEntry = true
        return field
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.red
        label.layer.borderWidth = 0
        label.isHidden = true
        return label
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Confirm Email", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerLabel)
        view.addSubview(emailField)
        view.addSubview(passField)
        view.addSubview(pass2Field)
        view.addSubview(errorLabel)
        view.addSubview(confirmButton)
        // Do any additional setup after loading the view.
        confirmButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        registerLabel.frame = CGRect(x: 20,
                                     y: 200,
                                     width: view.frame.size.width,
                                     height: 80)
        
        passField.frame = CGRect(x: 20,
                                 y: 350,//emailField.frame.origin.y + emailField.frame.size.height+10
                                 width: view.frame.size.width-40,
                                 height: 50)
        
        pass2Field.frame = CGRect(x: 20,
                                  y: passField.frame.origin.y + passField.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        emailField.frame = CGRect(x: 20,
                                  y: registerLabel.frame.origin.y + registerLabel.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        errorLabel.frame = CGRect(x: 20,
                                  y: pass2Field.frame.origin.y + pass2Field.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 40)
        
        confirmButton.frame = CGRect(x: 20,
                                     y: errorLabel.frame.origin.y + errorLabel.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 80)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    
    @objc private func didTapButton() {
        
        // F
        print("button works")
        guard let email = emailField.text, !email.isEmpty,
              let password = passField.text, !password.isEmpty  else{
                  // Missing field condition
                  errorLabel.text = "Missing field data"
                  errorLabel.isHidden = false
                  return
              }
        if password != pass2Field.text{
            //matching passwords condition
            errorLabel.text = "Ey! Your passwords don't match."
            errorLabel.isHidden = false
            return
        }
        
        // Get that auth instance!
        // create account, but if email is already registered
        // then create a popup to yell at the user
        
        // Initialize Authmanager with approved email + password
        let auth = AuthManager.init(email:email, password: password)
        
        //FIreBase API call!
        auth.register(){[weak self](success) in
            guard let strongSelf = self else{
                return
            }
            
            if success {
                
                // Success condition goes here
                //
                // Currently just hides UI elements. We'll
                // probably want to do something else, and
                // that'll go here.
                //
                let user1 = User.init(userID: auth.getUser())
                
                user1.updateName(name: "Paul McDunham")
                user1.updateAge(age: 47)
                user1.updateBio(bio: "Cool dude, with an even cooler bunch of cat companions! ")
                
                print("Big man tings dis. In other words, account created")
                strongSelf.registerLabel.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passField.isHidden = true
                strongSelf.pass2Field.isHidden = true
                strongSelf.errorLabel.isHidden = true
                strongSelf.confirmButton.isHidden = true
            } else {
                // Need additional error labels for
                // other failure conditions.
                //
                // Existing email is currently the default
                // error message, but firebase will raise checkable errors
                // under the hood for invalid emails.
                //
                // Addidtionaly, we may need to check for
                // valid passwords(no 'password123' paswords).
                strongSelf.errorLabel.text = "email exists, noob"
                strongSelf.errorLabel.isHidden = false
                
            }
        }
        
    
    }
    
   
}


