//
//  DetailViewModelInterface.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 01.05.2025.
//

import UIKit

protocol DetailViewModelInterface: AnyObject {
    var model: Morty? {get}
    var coordinator: (DetailCoordinatorInterface)? {get set}
    func getImage(completion: @escaping (UIImage?) -> Void)
}
