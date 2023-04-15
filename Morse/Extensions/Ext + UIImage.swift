//
//  Ext + UIImage.swift
//  Morse
//
//  Created by M I C H A E L on 14.04.2023.
//

import UIKit

// MARK: - Work on UIImage preparation
extension UIImage {
    enum Button {
        static func delete() -> UIImage? {
            UIImage(systemName: "multiply")
        }
        
        static func deleteLight() -> UIImage? {
            UIImage(systemName: "multiply.circle.fill")
        }
        
        static func fullScreen() -> UIImage? {
            UIImage(systemName: "arrow.up.left.and.arrow.down.right")
        }
        
        static func camera() -> UIImage? {
            UIImage(systemName: "camera")
        }
        
        static func cameraLight() -> UIImage? {
            UIImage(systemName: "camera.fill")
        }
        
        static func paste() -> UIImage? {
            UIImage(systemName: "plus.rectangle.on.rectangle")
        }
        
        static func pasteLight() -> UIImage? {
            UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill")
        }
        
        static func copy() -> UIImage? {
            UIImage(systemName: "doc.on.doc")
        }
        
        static func copyLight() -> UIImage? {
            UIImage(systemName: "doc.on.doc.fill")
        }
        
        static func reverse() -> UIImage? {
            UIImage(systemName: "arrow.triangle.swap")
        }
        
        static func alphabet() -> UIImage? {
            UIImage(systemName: "textformat.size.larger")
        }
        
        static func info() -> UIImage? {
            UIImage(systemName: "info.circle.fill")
        }
        
    }
}
