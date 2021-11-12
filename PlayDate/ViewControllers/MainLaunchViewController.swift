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
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 17
        return stackView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pin"))
        imageView.contentMode = .scaleAspectFill
        return UIImageView()
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.configuration?.cornerStyle = .small
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemBlue
        button.configuration?.cornerStyle = .small
        return button
    }()
    
    // Properties
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
        
        logoImageView.image = image
        verticalStackView.addArrangedSubview(logoImageView)
        verticalStackView.addArrangedSubview(loginButton)
        verticalStackView.addArrangedSubview(registerButton)
    }
}
