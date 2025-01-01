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

    private let introductionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let attractionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
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
        [attractionImageView, nameLabel, introductionLabel, urlButton].forEach { view.addSubview($0) }

        // Layout using Auto Layout
        attractionImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        introductionLabel.translatesAutoresizingMaskIntoConstraints = false
        urlButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            attractionImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            attractionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            attractionImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            attractionImageView.heightAnchor.constraint(equalTo: attractionImageView.widthAnchor, multiplier: 0.75),

            nameLabel.topAnchor.constraint(equalTo: attractionImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            introductionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            introductionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            introductionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            urlButton.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 20),
            urlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func populateData() {

        nameLabel.text = attraction.name
        introductionLabel.text = attraction.introduction ?? "No introduction available."

        if let imageURLString = attraction.imageURLStringArray?.first,
           let url = URL(string: imageURLString) {
            // Download image asynchronously (use a library like SDWebImage in a real app)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.attractionImageView.image = image
                    }
                }
            }
        }

        urlButton.isHidden = (attraction.urlString == nil)
    }

    // MARK: - Actions
//    @objc private func openURL() {
//        guard let urlString = attraction?.urlString, let url = URL(string: urlString) else { return }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
}
