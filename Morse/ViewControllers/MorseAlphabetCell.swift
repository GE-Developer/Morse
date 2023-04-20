//
//  MorseAlphabetCellTableViewCell.swift
//  Morse
//
//  Created by M I C H A E L on 15.04.2023.
//

import UIKit

final class MorseAlphabetCell: UITableViewCell {
 
    let originalLabel = UILabel()
    let morseLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        setConstraints()
        
        originalLabel.font = .avenir16()
        morseLabel.font = .morseFont18()
        
        originalLabel.adjustsFontSizeToFitWidth = true
        
        originalLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        morseLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.7563649361)
        morseLabel.textAlignment = .right
    
        backgroundColor = .NavBar.background()
        
        self.isUserInteractionEnabled = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(originalLabel)
        addSubview(morseLabel)
        
        originalLabel.translatesAutoresizingMaskIntoConstraints = false
        morseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            originalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            originalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            originalLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            originalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            morseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            morseLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            morseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            morseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}
