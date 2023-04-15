//
//  Ext + UITextView.swift
//  Morse
//
//  Created by M I C H A E L on 08.04.2023.
//

import UIKit

// MARK: - Work on UITextView preparation
extension UITextView {
    convenience init(_ font: UIFont?) {
        self.init()
        
        self.backgroundColor = .clear
        self.font = font
        self.textColor = .TVColor.mainText()
        self.textAlignment = .left
        self.autocorrectionType = .no
    }
}

