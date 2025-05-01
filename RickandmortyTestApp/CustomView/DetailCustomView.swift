//
//  DetailCustomView.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 01.05.2025.
//

import UIKit

final class DetailCustomView: UIView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    
    var imageV: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupScrollView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(_ model: Morty, image: UIImage?) {
        
        imageV.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageV)
        imageV.image = image ?? UIImage()
        imageV.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageV.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        let label1 = UILabel()
        label1.text = model.name == "" ? "name: -" : "name: \(model.name ?? "")"
        label1.font = .systemFont(ofSize: 20)
        label1.textColor = .black
        label1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let label2 = UILabel()
        label2.text = model.gender == "" ? "gender: -" : "gender: \(model.gender ?? "")"
        label2.font = .systemFont(ofSize: 20)
        label2.textColor = .black
        label2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let label3 = UILabel()
        label3.text = model.species == "" ? "species: -" : "species: \(model.species ?? "")"
        label3.font = .systemFont(ofSize: 20)
        label3.textColor = .black
        label3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let label4 = UILabel()
        label4.text = model.status == "" ? "status: -" : "status: \(model.status ?? "")"
        label4.font = .systemFont(ofSize: 20)
        label4.textColor = .black
        label4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let label5 = UILabel()
        label5.text = model.type == "" ? "type: -" : "type: \(model.type ?? "")"
        label5.font = .systemFont(ofSize: 20)
        label5.textColor = .black
        label5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stackView.addArrangedSubview(imageV)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(label4)
        stackView.addArrangedSubview(label5)
    }
    
    func setupStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
