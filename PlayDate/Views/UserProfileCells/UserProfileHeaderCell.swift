//
//  UserProfileHeaderCell.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/21/21.
//

import UIKit

class UserProfileHeaderCell: UITableViewCell {
    
    static let identifier = "UserProfileHeaderCell"
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 33
        return stackView
    }()
    
    private let editButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 29), scale: UIImage.SymbolScale.large)
        config.background.cornerRadius = 80
        config.cornerStyle = .fixed
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        
        return button
    }()
    
    private let cameraButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 29), scale: UIImage.SymbolScale.large)
        config.background.cornerRadius = 80
        config.cornerStyle = .fixed
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        
        return button
    }()
    
    private let signOutButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 29), scale: UIImage.SymbolScale.large)
        config.background.cornerRadius = 80
        config.cornerStyle = .fixed
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.setImage(UIImage(systemName: "arrow.up.forward.circle.fill"), for: .normal)
        
        return button
    }()

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.bluePurple
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: View Setup
    private func setupViews() {
        // Stack View
        self.contentView.addSubview(self.verticalStackView)
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.verticalStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.verticalStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.verticalStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
        ])
        
        // Profile Image
        guard let image = UIImage(named: "LogoMedium") else {
            print("Error - Could not load profile image")
            return
        }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.maskCircle(anyImage: image)
        self.verticalStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
        ])
        
        // Buttons
        self.verticalStackView.addArrangedSubview(self.buttonStackView)
        NSLayoutConstraint.activate([
            self.buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            self.buttonStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 31),
            self.buttonStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -31),
        ])
        
        self.buttonStackView.addArrangedSubview(editButton)
        self.buttonStackView.addArrangedSubview(cameraButton)
        self.buttonStackView.addArrangedSubview(signOutButton)
    }
}

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = .scaleAspectFill
    self.layer.cornerRadius = self.frame.size.width / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.image = anyImage
  }
}
