//
//  CoordinatorInterface.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

protocol CoordinatorInterface: AnyObject {
    var navigationController: UINavigationController? { get set }
    var cildren: [CoordinatorInterface] { get set }
}
