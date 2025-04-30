//
//  DetailCoordinatorInterface.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

protocol DetailCoordinatorInterface: CoordinatorInterface {
    var handlerBback: Block<()>? { get set }
    func start(with model: Morty)
    func eventOccurred(with type: DetailCoordinatorEvent)
}
