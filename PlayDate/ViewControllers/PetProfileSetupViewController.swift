//
//  PetRegisterViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit

class PetProfileSetupViewController: UIViewController {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()
    
//    let petNameTextField: UITextField = UITextField(frame: CGRect(x: 10, y: 320, width: 300.0, height: 30.0));
//    let petTypeTextField: UITextField = UITextField(frame: CGRect(x: 10, y: 360, width: 300.0, height: 30.0));
//    let petAgeTextField: UITextField = UITextField(frame: CGRect(x: 10, y: 400, width: 300.0, height: 30.0));
    
    let petSetupLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Pet Setup"
        label.textColor = .purple
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50.0)
        
        return label
    }()
    
    let petNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 320, width: 300.0, height: 30.0));
        textField.placeholder = "Pet Name"
        textField.textColor = .darkGray
        textField.textAlignment = .left
        
        let border = UIView()
        border.backgroundColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
        border.translatesAutoresizingMaskIntoConstraints = false

        textField.addSubview(border)

        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        border.widthAnchor.constraint(equalTo:textField.widthAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -1).isActive = true
        border.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
        return textField
    }()
    
    let petTypeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 360, width: 300.0, height: 30.0));
        textField.placeholder = "Pet Type"
        textField.textColor = .darkGray
        textField.textAlignment = .left
        
        let border = UIView()
        border.backgroundColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
        border.translatesAutoresizingMaskIntoConstraints = false

        textField.addSubview(border)

        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        border.widthAnchor.constraint(equalTo:textField.widthAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -1).isActive = true
        border.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
        return textField
    }()
    
    let petAgeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 400, width: 300.0, height: 30.0));
        textField.placeholder = "Pet Age"
        textField.textColor = .darkGray
        textField.textAlignment = .left
        
        let border = UIView()
        border.backgroundColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
        border.translatesAutoresizingMaskIntoConstraints = false

        textField.addSubview(border)

        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        border.widthAnchor.constraint(equalTo:textField.widthAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -1).isActive = true
        border.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
        return textField
    }()
    
    let addPicturesButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Add Pictures", attributes: container)
        
        return UIButton(configuration: config)
    }()
    
    let skipButton: UIButton = {
       let button = UIButton()
       button.setTitle("Skip for now", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
       button.configuration?.cornerStyle = .small
       return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }
    
    var image: UIImage?
    
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
        
        verticalStackView.addArrangedSubview(petSetupLabel)
        verticalStackView.addArrangedSubview(petNameTextField)
        verticalStackView.addArrangedSubview(petTypeTextField)
        verticalStackView.addArrangedSubview(petAgeTextField)
        verticalStackView.addArrangedSubview(addPicturesButton)
        verticalStackView.addArrangedSubview(skipButton)
        
    }
    
    

}
