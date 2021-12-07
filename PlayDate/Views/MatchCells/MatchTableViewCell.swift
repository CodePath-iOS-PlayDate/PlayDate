//
//  MatchTableViewCell.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    static let identifier = "MatchTableViewCell"
    
//    static let appUser: User = {
//        let user = User(userId: <#T##Int#>, name: <#T##String#>, bio: <#T##String#>, birthday: <#T##String#>, age: <#T##Int#>, pets: <#T##[Pet]#>)
//        return user
//    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemTeal
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let petNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        //label.text = appUser.pets
        return label
    }()
    
    private let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .regular)
        //label.text = appUser.name
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        //label.text = appUser.bio
        return label
    }()
    
//    private let noMatchesLabel: UILabel = {
//        let label = UILabel()
//        label.text = "No Matches"
//        label.textAlignment = .center
//        label.textColor = .gray
//        label.font = .systemFont(ofSize: 21, weight: .medium)
//
//        return label
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profileImageView)
        contentView.addSubview(petNameLabel)
        contentView.addSubview(ownerNameLabel)
        contentView.addSubview(descriptionLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 5, y: 0, width: 100, height: 100)
        
        petNameLabel.frame = CGRect(x: profileImageView.frame.size.width + 20,
                                      y: 10,
                                      width: contentView.frame.width - 20 - profileImageView.frame.width,
                                      height: (contentView.frame.height - 20) / 2)

        ownerNameLabel.frame = CGRect(x: profileImageView.frame.size.width + 100,
                                      y: 10,
                                      width: contentView.frame.width - 80 - profileImageView.frame.width,
                                      height: (contentView.frame.height - 20) / 2)
        
        descriptionLabel.frame = CGRect(x: profileImageView.frame.size.width + 20,
                                        y: ownerNameLabel.frame.size.height + 10,
                                        width: contentView.frame.width - 20 - profileImageView.frame.size.width,
                                        height: (contentView.frame.height - 20) / 2)
    }
    
}
