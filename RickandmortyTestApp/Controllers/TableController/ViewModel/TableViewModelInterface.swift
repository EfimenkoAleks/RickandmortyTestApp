//
//  TableViewModelInterface.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

protocol TableViewModelInterface: AnyObject {
    var models: [Morty] {get}
    var coordinator: (TableCoordinatorInterface)? {get set}
    var reloadTableView: Block<()>? {get set}
    func fetchModels(load: Bool)
    func model(at index: Int) -> Morty
    func getEvents(_ events: ListEvent)
}
