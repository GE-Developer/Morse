//
//  MorseAlphabetView.swift
//  Morse
//
//  Created by M I C H A E L on 15.04.2023.
//

import UIKit

final class MorseAlphabetView: UIViewController {
    
    let morseDict = morseCode
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .NavBar.background()
        title = "Alphabet"
        
        configureTableView()
        setTableViewDelegates()
        
        tableView.register(MorseAlphabetCell.self, forCellReuseIdentifier: "MorseCell")
        tableView.backgroundColor = .NavBar.background()
        tableView.separatorColor = .TVColor.borderAnimation()
        
    }
    
    
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.rowHeight = 60
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}



// MARK: - TableView setup
extension MorseAlphabetView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        morseDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MorseCell") as? MorseAlphabetCell
        cell?.morseLabel.text = "efef"
        
        return MorseAlphabetCell()
    }
}
