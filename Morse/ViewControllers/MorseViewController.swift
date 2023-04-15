//
//  MorseViewController.swift
//  Morse
//
//  Created by M I C H A E L on 08.04.2023.
//

import UIKit

final class MorseViewController: UIViewController {
    
    // MARK: - Private Properties
    private let originalTextView = UITextView(.avenir16())
    private let morseTextView = UITextView(.morseFont18())
    
    private let originalTopLabel = UILabel("English")
    private let morseTopLable = UILabel("Morse")
    
    private let originalCountLabel = UILabel()
    private let morseCountLabel = UILabel()
    
    private let deleteButton = UIButton(.Button.delete(), .Button.deleteLight())
    private let cameraButton = UIButton(.Button.camera(), .Button.cameraLight())
    private let pasteButton = UIButton(.Button.paste(), .Button.pasteLight())
    private let copyButton = UIButton(.Button.copy(), .Button.copyLight())
    private let reverseButton = UIButton(.Button.reverse())
    private let originalScreenButton = UIButton(.Button.fullScreen())
    private let morseScreenButton = UIButton(.Button.fullScreen())
    
    private lazy var originalView = BorderedTextView(
        textView: originalTextView,
        buttons: [pasteButton, cameraButton, originalScreenButton,deleteButton],
        countLabel: originalCountLabel
    )
    private lazy var morseView = BorderedTextView(
        textView: morseTextView,
        isEditable: false,
        buttons: [copyButton, morseScreenButton, reverseButton],
        countLabel: morseCountLabel
    )
    
    private let maxChar = 150
          
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Morse"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .NavBar.background()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.TVColor.background(),
            .font: UIFont.avenir20Heavy() ?? ""
        ]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.TVColor.background()
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .Button.info(), style: .done, target: self, action: #selector(showAlphabetView)),
            UIBarButtonItem(image: .Button.alphabet(), style: .done, target: self, action: #selector(showAlphabetView))
        ]
        
        view.setGradient(with: UIColor.Gradient.background())
        setupConstraints()
        
        originalTextView.delegate = self
        morseTextView.delegate = self
        
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        copyButton.addTarget(self, action: #selector(copyButtonPressed), for: .touchUpInside)
        pasteButton.addTarget(self, action: #selector(pasteButtonPressed), for: .touchUpInside)

        updateLabels()
        updateButtons()
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    @objc private func showAlphabetView() {
        let newVC = MorseAlphabetView()
        show(newVC, sender: nil)
    }
    
    
    @objc private func deleteButtonPressed() {
        originalTextView.text = nil
        morseTextView.text = nil
        updateLabels()
        updateButtons()
    }
    
    @objc private func copyButtonPressed() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = morseTextView.text

        let alert = UIAlertController(title: "Копирование текста", message: "Текст успешно скопирован в буфер обмена", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func pasteButtonPressed() {
        guard let clipboardContent = UIPasteboard.general.string else { return }
        guard !clipboardContent.isEmpty else { return }
        
        if clipboardContent.count > maxChar {
            let index = clipboardContent.index(clipboardContent.startIndex, offsetBy: maxChar)
            let clippedText = clipboardContent[..<index]
            originalTextView.text = String(clippedText)
        } else {
            originalTextView.text = clipboardContent
        }
        
        translate()
        updateLabels()
        updateButtons()
    }
    
    private func updateButtons() {
        if originalTextView.text.isEmpty {
            deleteButton.isEnabled = false
            copyButton.isEnabled = false
        } else {
            deleteButton.isEnabled = true
            copyButton.isEnabled = true
        }
    }
    
    private func updateLabels() {
        originalCountLabel.text = "\(originalTextView.text.count) / \(maxChar)"
        morseCountLabel.text = "\(morseTextView.text.count)"
        
        switch originalTextView.text.count {
        case (maxChar - 5)...:
            originalCountLabel.textColor = .TVColor.redLabel()
        case (maxChar - 30)...(maxChar - 5):
            originalCountLabel.textColor = .TVColor.yellowLabel()
        default:
            originalCountLabel.textColor = .TVColor.grayLabel()
        }
    }
    
    private func translate() {
        morseTextView.text = ""
        
        for character in originalTextView.text {
            let morseString = morseCode[Character(character.uppercased())]
            morseTextView.text += morseString ?? ""
            morseTextView.text += " "
        }
    }
}

// MARK: - Work with TextFields
extension MorseViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
//        MORSE TRANSLATE LOGICS
//        morseTextView.text = ""
//        let codes = originalTextView.text.components(separatedBy: " ")
//        for code in codes {
//            for (character, morse) in morseCode {
//                if morse == code {
//                    morseTextView.text += String(character)
//                }
//            }
//        }
        
        translate()
        updateLabels()
        updateButtons()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        
        return newText.count <= maxChar
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        animateBorder(originalView)
        animateBorder(originalTopLabel)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        originalView.layer.removeAllAnimations()
        originalTopLabel.layer.removeAllAnimations()
    }
    
    private func animateBorder(_ view: UIView) {
        let colorAnimation = CABasicAnimation()
        colorAnimation.fromValue = UIColor.TVColor.border().cgColor
        colorAnimation.toValue = UIColor.TVColor.borderAnimation().cgColor
        colorAnimation.duration = 0.5
        colorAnimation.repeatCount = .infinity
        colorAnimation.autoreverses = true
        view.layer.add(colorAnimation, forKey: "borderColor")
        
        let widthAnimation = CABasicAnimation()
        widthAnimation.fromValue = 2
        widthAnimation.toValue = 3
        widthAnimation.duration = 0.5
        widthAnimation.repeatCount = .infinity
        widthAnimation.autoreverses = true
        view.layer.add(widthAnimation, forKey: "borderWidth")
    }
}

// MARK: - Work with Constraints
private extension MorseViewController {
    func setupConstraints() {

        originalView.translatesAutoresizingMaskIntoConstraints = false
        morseView.translatesAutoresizingMaskIntoConstraints = false
        originalTopLabel.translatesAutoresizingMaskIntoConstraints = false
        morseTopLable.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(originalView)
        view.addSubview(morseView)
        view.addSubview(originalTopLabel)
        view.addSubview(morseTopLable)

        NSLayoutConstraint.activate([
            originalTopLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            originalTopLabel.centerXAnchor.constraint(equalTo: originalView.centerXAnchor),
            originalTopLabel.centerYAnchor.constraint(equalTo: originalView.topAnchor),
            originalTopLabel.widthAnchor.constraint(equalTo: originalView.widthAnchor, multiplier: 0.4),
            originalTopLabel.heightAnchor.constraint(equalToConstant: 30),

            originalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            originalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            originalView.heightAnchor.constraint(equalToConstant: view.frame.height / 4.2),

            morseTopLable.topAnchor.constraint(equalTo: originalView.bottomAnchor, constant: 16),
            morseTopLable.centerXAnchor.constraint(equalTo: morseView.centerXAnchor),
            morseTopLable.centerYAnchor.constraint(equalTo: morseView.topAnchor),
            morseTopLable.widthAnchor.constraint(equalTo: morseView.widthAnchor, multiplier: 0.4),
            morseTopLable.heightAnchor.constraint(equalToConstant: 30),

            morseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            morseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            morseView.heightAnchor.constraint(equalToConstant: view.frame.height / 3.8)
        ])
    }
}
