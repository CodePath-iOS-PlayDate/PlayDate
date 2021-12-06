//
//  MatchInfoTableViewCell.swift
//  PlayDate
//
//  Created by Michael Cubero on 12/4/21.
//

import UIKit

class MatchInfoTableViewCell: UITableViewCell {
    
    static let identifier = "MatchInfoTableViewCell"
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 30
        
        return stackView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0));
        label.text = "Info"
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        return label
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
            
        self.infoLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    private func setupView() {
        self.contentView.addSubview(verticalStackView)
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.verticalStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.verticalStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.verticalStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
        ])
        
        self.verticalStackView.addArrangedSubview(infoLabel)
    }
}
