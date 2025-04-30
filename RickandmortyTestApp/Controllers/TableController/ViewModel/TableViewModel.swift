//
//  TableViewModel.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import Foundation

final class TableViewModel: TableViewModelInterface {
 
    weak var coordinator: TableCoordinatorInterface?
    var models: [Morty] = []
    var numberOfModel: Int {
        return models.count
    }
    var reloadTableView: Block<()>?
    
    init(coordinator: TableCoordinatorInterface) {
        self.coordinator = coordinator
    }
    
    func model(at index: Int) -> Morty {
        return models[index]
    }
    
    func fetchModels() {
        // fetch model
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.models = [
                Morty(image: "square.and.arrow.up.fill", title: "Morty1"),
                Morty(image: "folder.fill", title: "Morty2"),
                Morty(image: "trash.fill", title: "Morty3"),
                Morty(image: "pencil.tip.crop.circle.badge.plus", title: "Morty4"),
                Morty(image: "eraser.fill", title: "Morty5")
            ]
            self.reloadTableView?(())
        }
    }
    
    func getEvents(_ events: ListEvent) {
        switch events {
        case .selected(let index):
            let model = model(at: index)
            coordinator?.eventOccurred(with: .detail(model))
        case .loadMore:
            break
        }
    }
}
