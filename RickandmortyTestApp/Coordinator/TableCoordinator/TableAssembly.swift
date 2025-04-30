//
//  TableAssembly.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class TableAssembly {

    public struct TableModule {
        let view: UIViewController
        let viewModel: TableViewModelInterface
    }
   
    // MARK: - Module setup -

    func createModule(coordinator: TableCoordinatorInterface) -> TableModule {
        let vModel = TableViewModel(coordinator: coordinator)
        let vc = TableController()
        vc.setViewModel(vModel)
        
        return TableModule(view: vc, viewModel: vModel)
    }
}
