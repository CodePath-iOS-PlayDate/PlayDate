//
//  OnboardingTextField.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/9/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class OnboardingTextField: UITextField {
    var textPadding = UIEdgeInsets(
        top: 15,
        left: 15,
        bottom: 15,
        right: 15
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.borderStyle = .roundedRect
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
