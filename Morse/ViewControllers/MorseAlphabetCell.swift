//
//  MorseAlphabetCellTableViewCell.swift
//  Morse
//
//  Created by M I C H A E L on 15.04.2023.
//

import UIKit

final class MorseAlphabetCell: UITableViewCell {
    
//    var originalText: Character!
//    var morseText: String!
    
    var originalLabel = UILabel()
    var morseLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        originalLabel.textColor = .TVColor.borderAnimation()
        morseLabel.textColor = .TVColor.borderAnimation()
        morseLabel.textAlignment = .right
    
        backgroundColor = .NavBar.background()
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
            originalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            originalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            originalLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            originalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            morseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            morseLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            morseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            morseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
}
