//
//  DetailAssembly.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class DetailAssembly {

    public struct DetailModule {
        let view: UIViewController
        let viewModel: DetailViewModelInterface
    }
   
    // MARK: - Module setup -

    func createModule(coordinator: DetailCoordinatorInterface, model: Morty) -> DetailModule {
        let vModel = DetailViewModel(coordinator: coordinator)
        vModel.model = model
        let vc = DetailControlller()
        vc.setViewModel(vModel)

        return DetailModule(view: vc, viewModel: vModel)
    }
}

