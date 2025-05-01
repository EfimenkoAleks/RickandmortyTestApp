//
//  TableViewModel.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import Foundation

final class TableViewModel: TableViewModelInterface {
 
    private var dataService: DataFetcher?
    weak var coordinator: TableCoordinatorInterface?
    var models: [Morty] = []
    
    var reloadTableView: Block<()>?
    
    init(coordinator: TableCoordinatorInterface) {
        self.coordinator = coordinator
        self.dataService = DataFetcher()
    }
    
    func model(at index: Int) -> Morty {
        return models[index]
    }
    
    func fetchModels(load: Bool) {
        dataService?.fetchData(load: load, completion: { [weak self] result in
            guard let self = self else { return }
            self.models += result
            self.reloadTableView?(())
        })
    }
    
    func getEvents(_ events: ListEvent) {
        switch events {
        case .selected(let index):
            let model = model(at: index)
            coordinator?.eventOccurred(with: .detail(model))
        case .loadMore:
            if Connectivity.isConnectedToNetwork() {
                fetchModels(load: true)
            }
        }
    }
}
