//
//  Ext + UIColor.swift
//  Morse
//
//  Created by M I C H A E L on 13.04.2023.
//

import UIKit

// MARK: - Work on UIColor preparation
extension UIColor {
    
    enum Gradient {
        static func background() -> [UIColor] { [#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), #colorLiteral(red: 0.2371303211, green: 0.2046647439, blue: 0.2666872625, alpha: 1), #colorLiteral(red: 0.2400550281, green: 0.1592444586, blue: 0.2839770118, alpha: 1), #colorLiteral(red: 0.3199191, green: 0.08372647133, blue: 0.3746734773, alpha: 1), #colorLiteral(red: 0.4430136983, green: 0.1394162962, blue: 0.4683914955, alpha: 1)] }
    }
    
    enum ButtonColor {
        static func bottomTF() -> UIColor { #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1) }
    }
    
    enum TVColor {
        static func background() -> UIColor { #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8994800492) }
        static func separator() -> UIColor { #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1) }
        static func border() -> UIColor { #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1) }
        static func borderAnimation() -> UIColor { #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1) }
        static func topLabel() -> UIColor { #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1) }
        static func grayLabel() -> UIColor { #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1) }
        static func yellowLabel() -> UIColor { #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.8048373595) }
        static func redLabel() -> UIColor { #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.79920818) }
        static func mainText() -> UIColor { #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
    }
    
    enum NavBar {
        static func background() -> UIColor { #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1) }
    }
}
