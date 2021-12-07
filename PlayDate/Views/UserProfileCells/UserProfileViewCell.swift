//
//  UserProfileViewCell.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/22/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class UserProfileViewCell: UITableViewCell {
    
    static let identifier = "UserProfileViewCell"
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 21
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePurple
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.text = "Nathan Michael"
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePurple
        label.text = "November 1, 1969"
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePurple
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum elit ac lacinia consequat. Cras malesuada massa felis, ac cursus tortor aliquet ac. Phasellus sed feugiat ante, in sodales massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam ac lectus diam. Quisque at felis non nulla ultricies consequat. Nulla purus nunc, convallis quis dignissim nec, pulvinar vel erat. Aliquam pellentesque at massa sed elementum. Phasellus in libero sed sem tempus convallis. Fusce suscipit porttitor elit, id suscipit magna porttitor pulvinar."
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        // Stack View
        self.contentView.addSubview(self.verticalStackView)
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 21),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 21),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -21),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -21)
        ])
        
        self.verticalStackView.addArrangedSubview(nameLabel)
        self.verticalStackView.addArrangedSubview(birthdayLabel)
        self.verticalStackView.addArrangedSubview(bioLabel)
    }
}
