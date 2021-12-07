//
//  CardContentView.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 12/6/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class CardContentView: UIView {
    private let backgroundView: UIView = {
        let background = UIView()
        background.clipsToBounds = true
        background.layer.cornerRadius = 10
        return background
    }()

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    init(withImage image: UIImage?) {
        super.init(frame: .zero)
        profileImageView.image = image
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func initialize() {
        self.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        backgroundView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
        
        self.applyShadow(radius: 10, opacity: 0.75, offset: CGSize(width: 0, height: 2))
    }
}

extension UIView {
  func applyShadow(radius: CGFloat,
                   opacity: Float,
                   offset: CGSize,
                   color: UIColor =  Colors.blueGreen
  ) {
      layer.shadowRadius = radius
      layer.shadowOpacity = opacity
      layer.shadowOffset = offset
      layer.shadowColor = color.cgColor
  }
}
