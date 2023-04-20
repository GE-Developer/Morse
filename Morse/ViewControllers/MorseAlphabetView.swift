//
//  MorseAlphabetView.swift
//  Morse
//
//  Created by M I C H A E L on 15.04.2023.
//

import UIKit

final class MorseAlphabetView: UIViewController {
    
    private let tableView = UITableView()
    private let segmentedControl = UISegmentedControl(items: ["Letters", "Digits", "Symbols"])
    
    private let morseDict = morseCode
    
    private var letters: [String] = []
    private var digits: [String] = []
    private var symbols: [String] = []
    
    private var data: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .NavBar.background()
        navigationItem.title = "Alphabet"
        
        tableView.register(MorseAlphabetCell.self, forCellReuseIdentifier: "MorseCell")
        tableView.backgroundColor = .NavBar.background()
        tableView.separatorColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.4)
        
        sortDictionary()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 0.0
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    private func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    private func sortDictionary() {
        for key in morseDict.keys {
            switch key {
            case ("A"..."Z"):
                letters.append(String(key))
            case ("0"..."9"):
                digits.append(String(key))
            case " ":
                break
            default:
                symbols.append(String(key))
                
            }
        }
        data.append(letters.sorted())
        data.append(digits.sorted())
        data.append(symbols.sorted())
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedSection = sender.selectedSegmentIndex
        
        tableView.scrollToRow(at: IndexPath(row: 0, section: selectedSection), at: .top, animated: true)
        
    }
}

// MARK: - TableView setup
extension MorseAlphabetView: UITableViewDelegate, UITableViewDataSource {
      
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else { return }
        
        guard let indexPath = tableView.indexPathsForVisibleRows?.first else { return }
        let currentSection = indexPath.section
        
        segmentedControl.selectedSegmentIndex = currentSection
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MorseCell", for: indexPath)
        guard let cell = cell as? MorseAlphabetCell else { return UITableViewCell() }
        
        let originalText = data[indexPath.section][indexPath.row]
        let morseText = morseDict[Character(originalText)]
        
        cell.originalLabel.text = originalText
        cell.morseLabel.text = morseText?.map {
            String($0)
        }.joined(separator: " ")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.frame.height / 13
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 20),
        ])

        headerView.backgroundColor = .NavBar.background()
        label.font = .avenir16Heavy()
        label.textColor = .TVColor.separator()

        switch section {
        case 0:
            label.text = "Letters"
        case 1:
            label.text = "Digits"
        default:
            label.text = "Symbols"
        }
        
        return headerView
    }
}
