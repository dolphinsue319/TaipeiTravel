//
//  TTSingleAttractionViewController.swift
//  TaipeiTravel
//
//  Created by Kedia on 2025/1/1.
//

import UIKit

class TTSingleAttractionViewController: UIViewController {

    // MARK: - Properties
    let attraction: TTAttractionModel

    init(attraction: TTAttractionModel) {
        self.attraction = attraction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let introductionTextView: UITextView = {
        let t = UITextView()
        t.font = UIFont.systemFont(ofSize: 16)
        t.textColor = .darkGray
        return t
    }()

    private let imagesCollectionView: TTImagesCollectionView = {
        let collectionView = TTImagesCollectionView()
        return collectionView
    }()

    private let urlButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Visit Website", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.systemBlue, for: .normal)
#warning("")
//        button.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateData()
    }

    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .white

        // Add subviews
        [imagesCollectionView, nameLabel, introductionTextView, urlButton].forEach { view.addSubview($0) }

        // Layout using Auto Layout
        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        introductionTextView.translatesAutoresizingMaskIntoConstraints = false
        urlButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imagesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imagesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imagesCollectionView.heightAnchor.constraint(equalTo: imagesCollectionView.widthAnchor, multiplier: 0.75),

            nameLabel.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            introductionTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            introductionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            introductionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            urlButton.topAnchor.constraint(equalTo: introductionTextView.bottomAnchor, constant: 20),
            urlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            urlButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func populateData() {

        nameLabel.text = attraction.name
        introductionTextView.text = attraction.introduction ?? "No introduction available."
        imagesCollectionView.imageURLs = attraction.imageURLStringArray ?? []
        urlButton.isHidden = (attraction.urlString == nil)
    }

    // MARK: - Actions
//    @objc private func openURL() {
//        guard let urlString = attraction?.urlString, let url = URL(string: urlString) else { return }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
}
