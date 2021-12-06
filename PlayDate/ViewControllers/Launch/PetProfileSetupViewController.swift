//
//  PetRegisterViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit

class PetProfileSetupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()
    
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
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    
        return textField
    }()
    
    let petTypeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 360, width: 300.0, height: 30.0));
        textField.placeholder = "Pet Type"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    
        return textField
    }()
    
    let petAgeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 400, width: 300.0, height: 30.0));
        textField.placeholder = "Pet Age"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    let addPicturesButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 36, weight: .medium)
        config.attributedTitle = AttributedString("Add Pictures", attributes: container)
        
        var action = UIAction() { _ in
                    print("Opening Camera Roll")
                }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    
    let skipButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.buttonSize = .small
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 20.0, weight: .regular)
        container.foregroundColor = .systemBlue
        config.attributedTitle = AttributedString("Skip for now", attributes: container)
        
        var action = UIAction() { _ in
                    print("Skipping ahead")
                }
        
        return UIButton(configuration: config, primaryAction: action)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
        
        
        // Pet Setup Label
        verticalStackView.addArrangedSubview(petSetupLabel)
        
        // Pet Name Text Field
        petNameTextField.setContentHuggingPriority(.required, for: .vertical)
        petNameTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(petNameTextField)
        petNameTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Pet Type Text Field
        petTypeTextField.setContentHuggingPriority(.required, for: .vertical)
        petTypeTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(petTypeTextField)
        petTypeTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Pet Age Text Field
        petAgeTextField.setContentHuggingPriority(.required, for: .vertical)
        petAgeTextField.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(petAgeTextField)
        petAgeTextField.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Add Pictures Button
        addPicturesButton.setContentHuggingPriority(.required, for: .vertical)
        addPicturesButton.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(addPicturesButton)
        addPicturesButton.translatesAutoresizingMaskIntoConstraints = false
        addPicturesButton.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        addPicturesButton.addTarget(self, action: #selector(uploadPetPictures(_:)), for: .touchUpInside)
        
        // Skip For Now Button
        verticalStackView.addArrangedSubview(skipButton)
        skipButton.addTarget(self, action: #selector(doSkipButton(_:)), for: .touchUpInside)
        
    }
    
    @objc func doSkipButton(_ sender: UIButton) {
        let homeTBC = HomeTabBarController()
        homeTBC.modalPresentationStyle = .fullScreen
        self.navigationController?.show(homeTBC, sender: self)
    }
    
    @objc func uploadPetPictures(_ sender: UIButton) {
        let alert = UIAlertController(title: "Profile Picture", message: "Please select a picture source", preferredStyle: .actionSheet)
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

    
    

}
