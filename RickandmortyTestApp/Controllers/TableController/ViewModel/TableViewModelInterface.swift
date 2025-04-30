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
    var numberOfModel: Int {get}
    var reloadTableView: Block<()>? {get set}
    func fetchModels()
    func model(at index: Int) -> Morty
    func getEvents(_ events: ListEvent)
}
