//
//  MainLaunchViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit

class MainLaunchViewController: UIViewController {
    
    // UI Element
    let verticalStackView: UIStackView = {
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
    
    let loginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Login", attributes: container)
        
        var action = UIAction() { _ in
            print("Going to Login VC")
        }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    
    let registerButton: UIButton = {
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
    
    // Properties
    var logoImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        // Stack View
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
        
        // Image View
        logoImageView.image = logoImage
        verticalStackView.addArrangedSubview(logoImageView)
        
        // Login Button
        loginButton.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Register Button
        registerButton.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
    }
}
