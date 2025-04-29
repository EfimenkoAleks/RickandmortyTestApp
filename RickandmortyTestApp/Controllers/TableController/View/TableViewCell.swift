//
//  TableViewCell.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add subviews
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        
        // Enable Auto Layout
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure layout
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    func configure(model: Morty) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(systemName: model.image)
    }
}
