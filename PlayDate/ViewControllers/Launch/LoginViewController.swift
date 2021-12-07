//
//  RegisterViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/9/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class LoginViewController: UIViewController {
    
    // UI Elements
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let emailTextField: OnboardingTextField = {
        let textField = OnboardingTextField()
        textField.placeholder = "Email"
        return textField
    }()
    
    let passwordTextField: OnboardingTextField = {
        let textField = OnboardingTextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Login", attributes: container)

        var action = UIAction() { _ in
            print("Going to Account Onboarding")
        }

        return UIButton(configuration: config, primaryAction: action)
    }()
    
    let noAccountLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "Don't have an account?"
        label.textColor = .systemBlue
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Properties
    var logoImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    func initView() {
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
        
        // Logo
        logoImageView.image = logoImage
        stackView.addArrangedSubview(logoImageView)
        
        // Email
        emailTextField.setContentHuggingPriority(.required, for: .vertical)
        emailTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(emailTextField)
        emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // Password
        passwordTextField.setContentHuggingPriority(.required, for: .vertical)
        passwordTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // Login Button
        loginButton.setContentHuggingPriority(.required, for: .vertical)
        loginButton.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginButton.addTarget(self, action: #selector(didLoginTapped(_:)), for: .touchUpInside)
    }
    
    @objc func didLoginTapped(_ sender: UITapGestureRecognizer) {
        AuthManager.email = emailTextField.text
        AuthManager.password = passwordTextField.text
        AuthManager.login() { [weak self] (success) in
            guard let self = self else { return }
            
            if success {
                UserDefaults.standard.setValue(true, forKey: CustomUserDefaults.isUserLoggedIn)
                
                let homeVC = HomeTabBarController()
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
            } else {
                let alert = UIAlertController(title: "Oops!", message: "Looks like we can't log you in right now. Please try again later.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
