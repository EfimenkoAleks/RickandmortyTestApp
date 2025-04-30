//
//  TableCoordinator.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class TableCoordinator: TableCoordinatorInterface {
    
    init(with window: UIWindow?) {
        self.window = window
        
        startRoot()
    }
    
    var cildren: [CoordinatorInterface] = []
    var navigationController: UINavigationController?
    private var window: UIWindow?
    
    func startRoot() {
        guard let window = window else { return }

        let module = TableAssembly().createModule(coordinator: self)
        navigationController = UINavigationController(rootViewController: module.view)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension TableCoordinator {
    
    func eventOccurred(with type: TableCoordinatorEvent) {
        switch type {
        case .detail(let model):
            let detailCoordinator: DetailCoordinatorInterface = DetailCoordinator()
            detailCoordinator.navigationController = navigationController
            cildren.append(detailCoordinator)
            detailCoordinator.start(with: model)
            detailCoordinator.handlerBback = { [weak self] _ in
                guard let self = self else { return }
                self.eventOccurred(with: .back)
            }
        case .back:
            navigationController?.popViewController(animated: true)
            cildren.removeLast()
        }
    }
}
