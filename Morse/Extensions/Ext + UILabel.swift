//
//  Ext + UILabel.swift
//  Morse
//
//  Created by M I C H A E L on 14.04.2023.
//

import UIKit

// MARK: - Work on UILabel preparation
extension UILabel {
    convenience init (_ text: String) {
        self.init()
        
        self.text = text
        self.textColor = .white
        self.font = .avenir16Heavy()
        self.layer.backgroundColor = UIColor.TVColor.topLabel().cgColor
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.TVColor.border().cgColor
        self.textAlignment = .center
    }
}
