//
//  MatchPicturesTableViewCell.swift
//  PlayDate
//
//  Created by Michael Cubero on 12/4/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class MatchPicturesTableViewCell: UITableViewCell {

    static let identifier = "MatchPicturesTableViewCell"
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        
        return stackView
    }()
    
    let picture1ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picture2ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picture3ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picture4ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picture5ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picture6ImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let picturesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
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
            print("Error - could not load image")
            
            return
        }
        
        self.verticalStackView.addArrangedSubview(self.picturesStackView)
        NSLayoutConstraint.activate([
            self.picturesStackView.heightAnchor.constraint(equalToConstant: 100),
            self.picturesStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 31),
            self.picturesStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -31),
        ])
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView1.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView1)
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView2.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView2)
            imageView2.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView2.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView3.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView3)
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView3.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        let imageView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView4.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView4)
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView4.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        let imageView5 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView5.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView5)
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView5.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
        
        let imageView6 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
            imageView6.maskCircle(anyImage: image)
            self.picturesStackView.addArrangedSubview(imageView6)
            imageView6.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView6.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height)
            ])
    }
    
    

}
