//
//  DetailCoordinator.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class DetailCoordinator: DetailCoordinatorInterface {
 
    init() {}
    
    var cildren: [CoordinatorInterface] = []
    var navigationController: UINavigationController?
    var handlerBback: Block<()>?
    
    func start(with model: Morty) {
        let module = DetailAssembly().createModule(coordinator: self, model: model)
        navigationController?.pushViewController(module.view, animated: true)
    }
}

extension DetailCoordinator {
    
    func eventOccurred(with type: DetailCoordinatorEvent) {
        switch type {
        case .back:
            break
        }
    }
}

