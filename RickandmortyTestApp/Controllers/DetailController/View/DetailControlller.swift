//
//  DetailControlller.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

class DetailControlller: BaseController {
    
    var viewModel: DetailViewModelInterface?
    var customView: DetailCustomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    func setViewModel(_ vModel: DetailViewModelInterface) {
        self.viewModel = vModel
        guard let model = viewModel?.model else { return }
        setContent(model: model)
    }
}

private extension DetailControlller {
    func createUI() {
        customView = DetailCustomView(frame: view.frame)
        self.view = customView
    }
    
    func setContent(model: Morty) {
        viewModel?.getImage(completion: { [weak self] image in
            guard let self = self else { return }
            self.customView?.setContent(model, image: image)
        })
    }
}
