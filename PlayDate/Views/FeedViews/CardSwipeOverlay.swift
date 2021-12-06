//
//  CardSwipeOverlay.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 12/6/21.
//

import UIKit
import Shuffle_iOS

class CardSwipeOverlay: UIView {
    
    init(swipeDirection: SwipeDirection) {
        super.init(frame: .zero)
        switch swipeDirection {
        case .left:
            initLeftOverlay()
        case .right:
            initRightOverlay()
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func initLeftOverlay() {
        let leftTextView = CardSwipeOverlayLabelView(
            withTitle: "NOPE",
            color: Colors.bluePurple,
            rotation: CGFloat.pi / 10
        )
        addSubview(leftTextView)
        leftTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            leftTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 14)
        ])
    }
    
    private func initRightOverlay() {
        let rightTextView = CardSwipeOverlayLabelView(
            withTitle: "LIKE",
            color: Colors.blueGreen,
            rotation: -CGFloat.pi / 10
        )
        addSubview(rightTextView)
        rightTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 26),
            rightTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14)
        ])
    }
}

private class CardSwipeOverlayLabelView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    init(withTitle title: String, color: UIColor, rotation: CGFloat) {
        super.init(frame: CGRect.zero)
        layer.borderColor = color.cgColor
        layer.borderWidth = 4
        layer.cornerRadius = 4
        transform = CGAffineTransform(rotationAngle: rotation)
        
        titleLabel.textColor = color
        titleLabel.attributedText = NSAttributedString(
            string: title,
            attributes: [.font: UIFont(name: "HelveticaNeue-Bold", size: 42)!, .kern: 5.0]
        )
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
      return nil
    }
}

