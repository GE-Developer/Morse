//
//  Ext + UIButton.swift
//  Morse
//
//  Created by M I C H A E L on 14.04.2023.
//

import UIKit

// MARK: - Work on UIButton preparation
extension UIButton {
    convenience init(_ normal: UIImage?, _ highlited: UIImage? = nil) {
        self.init(type: .system)
        
        self.setImage(normal, for: .normal)
        self.setImage(highlited, for: .highlighted)
    }
}
