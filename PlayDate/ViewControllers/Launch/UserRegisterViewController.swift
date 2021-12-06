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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let registerLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Register"
        label.font = .systemFont(ofSize: 36, weight: .semibold)
        return label
    }()
    
    private let emailField: OnboardingTextField = {
        let field = OnboardingTextField()
        field.placeholder = "Email Address"
        return field
    }()
    
    private let passField: OnboardingTextField = {
        let field = OnboardingTextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        return field
    }()
    
    private let pass2Field: OnboardingTextField = {
        let field = OnboardingTextField()
        field.placeholder = "Confirm Password"
        field.isSecureTextEntry = true
        return field
    }()
    
    private let confirmButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Register", attributes: container)
        
        var action = UIAction() { _ in
            print("Going to Regsiter VC")
        }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    
    var logoImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        hidesKeyboard()
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    private func initView() {
        // Stack View
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
        
        // Logo Image
        logoImageView.image = logoImage
        stackView.addArrangedSubview(logoImageView)
        
        // Email Field
        emailField.setContentHuggingPriority(.required, for: .vertical)
        emailField.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(emailField)
        emailField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // Password Field
        passField.setContentHuggingPriority(.required, for: .vertical)
        passField.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(passField)
        passField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // Confirm Password Field
        pass2Field.setContentHuggingPriority(.required, for: .vertical)
        pass2Field.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(pass2Field)
        pass2Field.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // Confirm Button
        confirmButton.setContentHuggingPriority(.required, for: .vertical)
        confirmButton.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        confirmButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func hidesKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Selectors
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapButton() {
        
        // F
        print("button works")
        guard let email = emailField.text, !email.isEmpty,
              let password = passField.text, !password.isEmpty else {
                  // Missing field condition
                  let alert = UIAlertController(title: "Oops!", message: "Looks like you left some data unfilled. Please fill before continuing.", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                  self.present(alert, animated: true)
                  return
              }
        if password != pass2Field.text{
            //matching passwords condition
            let alert = UIAlertController(title: "Oops!", message: "Looks like your passwords do not match. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // Get that auth instance!
        // create account, but if email is already registered
        // then create a popup to yell at the user
        
        // Initialize Authmanager with approved email + password
        AuthManager.email = email
        AuthManager.password = password
        
        //FIreBase API call!
        AuthManager.register() { [weak self] (success) in
            guard let strongSelf = self else{
                return
            }
            
            if success {
                // Success condition goes here
                //
                // Currently just hides UI elements. We'll
                // probably want to do something else, and
                // that'll go here.
                
                print("Big man tings dis. In other words, account created")
                UserDefaults.standard.setValue(true, forKey: CustomUserDefaults.isUserLoggedIn)
                
                let userSetupVC = UserProfileSetupViewController()
                userSetupVC.modalPresentationStyle = .fullScreen
                strongSelf.present(userSetupVC, animated: true)
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
                let alert = UIAlertController(title: "Oops!", message: "Looks like this email already exists. Please try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                strongSelf.present(alert, animated: true)
            }
        }
    }
}


