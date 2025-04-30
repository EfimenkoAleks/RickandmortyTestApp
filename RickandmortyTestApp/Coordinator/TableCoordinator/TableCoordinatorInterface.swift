//
//  c.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

protocol TableCoordinatorInterface: CoordinatorInterface {
    func startRoot()
    func eventOccurred(with type: TableCoordinatorEvent)
}
