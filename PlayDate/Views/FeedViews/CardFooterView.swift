//
//  CardFooterView.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 12/6/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class CardFooterView: UIView {
    
    private var label = UILabel()
    private var gradientLayer: CAGradientLayer?
    
    init(withTitle title: String?, subtitle: String?) {
        super.init(frame: .zero)
        backgroundColor = .clear
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 10
        clipsToBounds = true
        isOpaque = false
        initialize(title: title, subtitle: subtitle)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func initialize(title: String?, subtitle: String?) {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        shadow.shadowBlurRadius = 2
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
        
        // Configure main title
        let attributedString = NSMutableAttributedString(
            string: (title ?? "") + "\n",
            attributes: [
                .font: UIFont(name: "ArialRoundedMTBold", size: 24)!,
                .foregroundColor: UIColor.white,
                .shadow: shadow
            ]
        )
        
        // Configure subtitle
        if let subtitle = subtitle, !subtitle.isEmpty {
            attributedString.append(
                NSMutableAttributedString(
                    string: subtitle,
                    attributes: [
                        .font: UIFont(name: "Arial", size: 17)!,
                        .foregroundColor: UIColor.white,
                        .shadow: shadow
                    ]
                )
            )
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            paragraphStyle.lineBreakMode = .byTruncatingTail
            attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle],
                                         range: NSRange(location: 0, length: attributedString.length))
            label.numberOfLines = 2
        }
        
        label.attributedText = attributedString
        addSubview(label)
    }
    
    override func layoutSubviews() {
      let padding: CGFloat = 20
      label.frame = CGRect(x: padding,
                           y: bounds.height - label.intrinsicContentSize.height - padding,
                           width: bounds.width - 2 * padding,
                           height: label.intrinsicContentSize.height)
    }
}
