//
//  UserProfileSetupViewController.swift
//  PlayDate
//
//  Created by Gustavo Cornejo on 12/4/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import Foundation
import UIKit

class UserProfileSetupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()
    
    let userSetupLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Profile Setup"
        label.textColor = .purple
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50.0)
        
        return label
    }()
    
    
    let userNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 320, width: 300.0, height: 30.0));
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    
        return textField
    }()
    
    let userBioTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 360, width: 300.0, height: 30.0));
        textField.placeholder = "Bio"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    
        return textField
    }()
    
    let userAgeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 400, width: 300.0, height: 30.0));
        textField.keyboardType = .numberPad
        textField.placeholder = "Age"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    let addProfilePictureButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Add Profile Picture", attributes: container)
        
        var action = UIAction() { _ in
                    print("Opening Camera Roll")
                }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    
    let doneButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.buttonSize = .small
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 20.0, weight: .regular)
        container.foregroundColor = .systemBlue
        config.attributedTitle = AttributedString("Done", attributes: container)
        
        var action = UIAction() { _ in
            print("done tapped")
        }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        hidesKeyboard()
        initView()
    }

    // Properties
    var image: UIImage?
    
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
        
        // User Setup Label
        verticalStackView.addArrangedSubview(userSetupLabel)
        
        // User Name Text Field
        userNameTextField.setContentHuggingPriority(.required, for: .vertical)
        userNameTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(userNameTextField)
        userNameTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // User Bio Text View
        userBioTextField.setContentHuggingPriority(.required, for: .vertical)
        userBioTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(userBioTextField)
        userBioTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // User Age Text Field
        userAgeTextField.setContentHuggingPriority(.required, for: .vertical)
        userAgeTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(userAgeTextField)
        userAgeTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Add Profile Picture Button
        addProfilePictureButton.setContentHuggingPriority(.required, for: .vertical)
        addProfilePictureButton.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(addProfilePictureButton)
        addProfilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        addProfilePictureButton.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        addProfilePictureButton.addTarget(self, action: #selector(uploadProfilePicture(_:)), for: .touchUpInside)
        
        // Done Button
        verticalStackView.addArrangedSubview(doneButton)
        doneButton.addTarget(self, action: #selector(userToPetSetup(_:)), for: .touchUpInside)
        
    }
    
    //This needs some kind of error handling ***GUS
    @objc func userToPetSetup(_ sender: UIButton) {
        guard let username = userSetupLabel.text else {
            self.presentAlert(title: "Oops!", message: "Looks like you left Username blank. Please fix and try again.")
            return
        }
        guard let bio = userBioTextField.text else {
            self.presentAlert(title: "Oops!", message: "Looks like you left Bio blank. Please fix and try again.")
            return
        }
        guard let age = userAgeTextField.text else {
            self.presentAlert(title: "Oops!", message: "Looks like you left Age blank. Please fix and try again.")
            return
        }
        guard let ageNum = Int(age) else {
            self.presentAlert(title: "Oops!", message: "Age is supposed to be a number. Please fix and try again.")
            return
        }
        guard let userId = AuthManager.id else {
            self.presentAlert(title: "Oops!", message: "Something went wrong with registering. Please close app and try again.")
            return
        }

        let user = User(userID: userId)
        user.updateName(name: username)
        user.updateBio(bio: bio)
        user.updateAge(age: ageNum)
       
        let petSetupVC = PetProfileSetupViewController()
        petSetupVC.modalPresentationStyle = .fullScreen
        self.navigationController?.show(petSetupVC, sender: self)
    }
    
    @objc func uploadProfilePicture(_ sender: UIButton) {
        let alert = UIAlertController(title: "Select a Source", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            let picker = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
            } else {
                picker.sourceType = .photoLibrary
            }
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        
        //Firebase stuff go here
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func hidesKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
