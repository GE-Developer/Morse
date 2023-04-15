//
//  MorseAlphabetView.swift
//  Morse
//
//  Created by M I C H A E L on 15.04.2023.
//

import UIKit

class MorseAlphabetView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        dismiss(animated: true)
    }

}
