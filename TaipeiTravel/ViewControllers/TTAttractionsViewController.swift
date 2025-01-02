//
//  TTAttractionsViewController.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import UIKit
import Combine
import Kingfisher

class TTAttractionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = languageItem
        self.navigationItem.title = TTLocalizationManager.shared.localizedString("touristAttractions")

        TTLocalizationManager.shared.userPreferredLanguageDidChangeSubject.sink { [weak self] _ in
            self?.viewModel.fetchAttractions(isRefresh: true)
            self?.navigationItem.title = TTLocalizationManager.shared.localizedString("touristAttractions")
        }.store(in: &subscriptions)

        viewModel.didFetchAttractions.sink { [weak self] in
            guard let self else { return }
            Task { @MainActor in
                self.tableView.reloadData()
            }
        }.store(in: &subscriptions)

        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        viewModel.fetchAttractions(isRefresh: true)
    }

    // MARK: - private
    static let cellIdentifier: String = "cell"
    static let newsCellIdentifier: String = "newsCell"
    private let viewModel = TTAttractionsViewControllerVM(apiManager: TTRestfulAPIManagerImpl())
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TTCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.newsCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemBackground
        return tableView
    }()

    private var subscriptions: Set<AnyCancellable> = .init()

    private lazy var languageItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: UIImage(systemName: "globe"), style: .plain, target: self, action: #selector(didTapLanguageItem))
        return item
    }()

    @objc func didTapLanguageItem() {
        let vc = TTLocalizationTableViewController()
        self.present(vc, animated: true)
    }
}

extension TTAttractionsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return viewModel.numberOfAttractions
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Self.newsCellIdentifier, for: indexPath)
            cell.textLabel?.text = TTLocalizationManager.shared.localizedString("latestNews")
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as? TTCell else {
            return UITableViewCell()
        }

        guard let attraction = viewModel.attraction(at: indexPath.row) else { return cell }
        cell.name = attraction.name
        cell.intro = attraction.introduction
        if let imageURLString = attraction.imageURLStringArray?.first {
            cell.imageURLString = imageURLString
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 { return }
        if indexPath.row == viewModel.numberOfAttractions - 2 {
            viewModel.fetchAttractions(isRefresh: false)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            guard let url = viewModel.newsPageURL() else {
                return
            }
            let vc = TTWebViewController(url: url)
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        guard let attraction = viewModel.attraction(at: indexPath.row) else { return }
        let vc = TTSingleAttractionViewController(attraction: attraction)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

fileprivate class TTCell: UITableViewCell {

    var name: String? {
        didSet { nameLabel.text = name }
    }

    var intro: String? {
        didSet { introLabel.text = intro }
    }

    var imageURLString: String? {
        didSet {
            guard let imageURLString else { return }
            guard let url = URL(string: imageURLString) else { return }
            preImageView.kf.setImage(with: url, placeholder: UIImage(named: "DownloadIcon"))
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(preImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(introLabel)

        preImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        preImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        preImageView.widthAnchor.constraint(equalTo: preImageView.heightAnchor, multiplier: 1).isActive = true
        preImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: preImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        introLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        introLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        introLabel.leadingAnchor.constraint(equalTo: preImageView.trailingAnchor, constant: 8).isActive = true
        introLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Privates

    private lazy var preImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        return label
    }()

    private lazy var introLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    
}
