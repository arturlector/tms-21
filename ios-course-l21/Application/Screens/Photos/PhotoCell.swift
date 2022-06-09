//
//  PhotoCell.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 19.05.2022.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    //MARK: - Private properties
    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
       
       
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    func configure(_ tuple: (String, String)) {
        self.likesLabel.text = tuple.0
        self.photoImageView.image = UIImage(named: tuple.1)
    }
    
    //MARK: - Private
    private func setupViews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(likesLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 0),
            likesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        //photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        //photoImageView.clipsToBounds = true
        
    }
    
}
