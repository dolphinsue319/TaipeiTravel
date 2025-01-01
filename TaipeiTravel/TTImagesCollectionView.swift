//
//  TTImagesCollectionView.swift
//  TaipeiTravel
//
//  Created by Kedia on 2025/1/1.
//

import UIKit
import Kingfisher

class TTImagesCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Properties
    var imageURLs: [String] = [] {
        didSet {
            reloadData() // 更新資料時重新載入
        }
    }

    // MARK: - Initializers
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func commonInit() {
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
        register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        let imageURL = imageURLs[indexPath.item]
        cell.configure(with: imageURL)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: self.bounds.height)
    }
}

// MARK: - Custom UICollectionViewCell
class ImageCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "ImageCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        imageView.kf.setImage(with: url)
    }
}