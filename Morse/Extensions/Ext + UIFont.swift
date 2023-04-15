//
//  Ext + UIFont.swift
//  Morse
//
//  Created by M I C H A E L on 08.04.2023.
//

import UIKit

// MARK: - Work on UIFont preparation
extension UIFont {
    static func avenir16() -> UIFont? {
        UIFont(name: "Avenir", size: 16)
    }
    
    static func avenir16Heavy() -> UIFont? {
        UIFont(name: "Avenir-Heavy", size: 16)
    }
    
    static func avenir20Heavy() -> UIFont? {
        UIFont(name: "Avenir-Heavy", size: 20)
    }
    
    
    static func morseFont18() -> UIFont? {
        UIFont(name: "Georgia-Bold", size: 18)
    }
}
