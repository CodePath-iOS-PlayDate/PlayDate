//
//  RegisterViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/9/21.
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
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: OnboardingTextField = {
        let textField = OnboardingTextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Register", attributes: container)

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
        initView()
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
        
        // Register Button
        loginButton.setContentHuggingPriority(.required, for: .vertical)
        loginButton.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        // No Account Label
        noAccountLabel.setContentHuggingPriority(.required, for: .vertical)
        noAccountLabel.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(labelTapped(_:))
        ))
        stackView.addArrangedSubview(noAccountLabel)
        noAccountLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        print("Don't have an account? was tapped")
    }
}
