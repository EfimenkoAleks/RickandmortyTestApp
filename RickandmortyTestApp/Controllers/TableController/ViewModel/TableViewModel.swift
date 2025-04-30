//
//  TableViewModel.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import Foundation

final class TableViewModel: TableViewModelInterface {
 
    private var apiService: NetworkService?
    weak var coordinator: TableCoordinatorInterface?
    var models: [Morty] = []
    var nextPath: String?
    var reloadTableView: Block<()>?
    
    init(coordinator: TableCoordinatorInterface,
         apiService: NetworkService = DIContainer.default.networkService) {
        self.coordinator = coordinator
        self.apiService = apiService
    }
    
    func model(at index: Int) -> Morty {
        return models[index]
    }
    
    func fetchModels(load: NetworkLoadEvent) {
        apiService?.fetchCharacter(load: load) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let models):
                self.models += models.results
                self.nextPath = models.info?.next
                self.reloadTableView?(())
            case .failure(let error):
                break
            }
        }
    }
    
    func getEvents(_ events: ListEvent) {
        switch events {
        case .selected(let index):
            let model = model(at: index)
            coordinator?.eventOccurred(with: .detail(model))
        case .loadMore:
            guard let path = nextPath else { return }
            fetchModels(load: .loadMore(path))
        }
    }
}
