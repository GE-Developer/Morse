//
//  BorderedUITextView.swift
//  Morse
//
//  Created by M I C H A E L on 08.04.2023.
//

import UIKit

final class BorderedTextView: UIView {
    init(textView: UITextView, isEditable: Bool = true, buttons: [UIButton], countLabel: UILabel) {
        super.init(frame: .zero)
        
        backgroundColor = .TVColor.background()
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.TVColor.border().cgColor
        
        let separatorView = UIView()
        separatorView.backgroundColor = .TVColor.separator()
        
        let stackViewButtons = UIStackView(arrangedSubviews: buttons)
        stackViewButtons.axis = .horizontal
        stackViewButtons.spacing = 16
        stackViewButtons.distribution = .fillEqually
        
        textView.textAlignment = .left
        textView.isEditable = isEditable
        buttons.forEach { $0.tintColor = .ButtonColor.bottomTF() }
        
        countLabel.font = .avenir16()
        countLabel.textColor = .TVColor.grayLabel()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textView)
        addSubview(countLabel)
        addSubview(separatorView)
        addSubview(stackViewButtons)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            separatorView.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -10),
            separatorView.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 3),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            stackViewButtons.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 2),
            stackViewButtons.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor),
            stackViewButtons.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            countLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 2),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            countLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 10),
            countLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
