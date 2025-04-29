//
//  BaseController.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import UIKit

class BaseController: UIViewController {
  
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createTitle(_ title: String = "") {
        let customTitleLabel = TitleLabel(title: title)
        navigationItem.titleView = customTitleLabel
    }
    
    private func setBackground() {
        self.view.backgroundColor = Colors.lilac.color
    }
}
