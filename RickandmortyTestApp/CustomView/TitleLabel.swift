//
//  TitleLabel.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import UIKit

class TitleLabel: UILabel {
    
    init(title: String, color: UIColor? = nil) {
        let frame: CGRect = CGRect(x: 0, y: 0, width: 250, height: 44)
        super.init(frame: frame)
        setTitle(title: title, color: color)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    func setTitle(title: String, color: UIColor? = nil) {
        text = title
        font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textAlignment = .center
        textColor = .black
        if let color = color {
            textColor = color
        }
    }
}
