//
//  MatchHeaderTableViewCell.swift
//  PlayDate
//
//  Created by Michael Cubero on 12/4/21.
//

import UIKit

class MatchHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "MatchHeaderTableViewCell"
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 30
        
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    private let petNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Pet Names"
        label.textColor = .systemTeal
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        return label
    }()
    
    private let petOwnerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 200.0));
        label.text = "Owner Name"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.bluePurple
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
        self.petOwnerLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.petNameLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    private func setupView() {
        self.contentView.addSubview(verticalStackView)
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.verticalStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.verticalStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.verticalStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
        ])
        
        guard let image = UIImage(named: "LogoMedium") else {
            print("Error - could not load profile image")
            
            return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.maskCircle(anyImage: image)
            self.verticalStackView.addArrangedSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        self.verticalStackView.addArrangedSubview(self.labelsStackView)
        NSLayoutConstraint.activate([
            self.labelsStackView.heightAnchor.constraint(equalToConstant: 75),
            self.labelsStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 31),
            self.labelsStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -31),
        ])
        
        self.labelsStackView.addArrangedSubview(petOwnerLabel)
        self.labelsStackView.addArrangedSubview(petNameLabel)
    }
    
}
