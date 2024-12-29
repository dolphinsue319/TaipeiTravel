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
        viewModel.fetchAttractions()
    }

    // MARK: - private
    static let cellIdentifier: String = "cell"
    private let viewModel = TTAttractionsViewControllerVM(apiManager: TTRestfulAPIManagerImpl())
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemBackground
        return tableView
    }()

    private var subscriptions: Set<AnyCancellable> = .init()
}

extension TTAttractionsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfAttractions
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        guard let attraction = viewModel.attraction(at: indexPath.row) else { return cell }
        cell.textLabel?.text = attraction.name
        if let imageURLString = attraction.imageURLStringArray?.first, let url = URL(string: imageURLString) {
            cell.imageView?.kf.setImage(with: url)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfAttractions - 2 {
            viewModel.fetchAttractions()
        }
    }
}

