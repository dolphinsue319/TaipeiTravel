//
//  TTLocalizationTableViewController.swift
//  TaipeiTravel
//
//  Created by Kedia on 2025/1/2.
//

import UIKit

class TTLocalizationTableViewController: UITableViewController {

    fileprivate static let cellIdentifier = "LanguageCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TTLocalizationManager.shared.languages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        let language = TTLocalizationManager.shared.languages[indexPath.row]
        cell.textLabel?.text = "\(language)"
        if language == TTLocalizationManager.shared.userPreferredLanguage {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= TTLocalizationManager.shared.languages.count {
            return
        }
        let selectedLanguage = TTLocalizationManager.shared.languages[indexPath.row]
        if selectedLanguage == TTLocalizationManager.shared.userPreferredLanguage {
            return
        }
        TTLocalizationManager.shared.userPreferredLanguage = selectedLanguage
        self.dismiss(animated: true)
    }
}

