//
//  MatchContactInfoViewController.swift
//  PlayDate
//
//  Created by Michael Cubero on 11/28/21.
//

import UIKit

class MatchContactInfoViewController: UIViewController {

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 27
        return stackView
    }()

    let petNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Pet Name"
        label.backgroundColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 25.0)

        return label
    }()

    let petOwnerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Owner Name"
        label.backgroundColor = .white
        label.textAlignment = .right
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 22.0)

        return label
    }()

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemTeal
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    let picturesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Pictures"
        label.backgroundColor = .white
        label.textAlignment = .right
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 22.0)

        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Info"
        label.backgroundColor = .white
        label.textAlignment = .right
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 22.0)

        return label
    }()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            initView()
            configureItems()
        }


    var image: UIImage?
    
    // Back button at the navigation bar
    private func configureItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", image: nil, primaryAction: nil, menu: nil)
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
        
        // Placeholder for match's profile photo
        profileImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(profileImageView)
        profileImageView.leftAnchor.constraint(equalTo: verticalStackView.leftAnchor).isActive = true

        // Placeholder for pet name information
        petNameLabel.setContentHuggingPriority(.required, for: .vertical)
        petNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(petNameLabel)
        petNameLabel.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Placeholder for pet owner information
        petOwnerLabel.setContentHuggingPriority(.required, for: .vertical)
        petOwnerLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(petOwnerLabel)
        petOwnerLabel.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
        
        // Placeholder for design sake until I clarify what goes here
        picturesLabel.setContentHuggingPriority(.required, for: .vertical)
        picturesLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(picturesLabel)
        
        // Placeholder text for match's information
        infoLabel.setContentHuggingPriority(.required, for: .vertical)
        infoLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        verticalStackView.addArrangedSubview(infoLabel)


    }
    

}

