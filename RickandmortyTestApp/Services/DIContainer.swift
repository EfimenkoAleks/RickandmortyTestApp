//
//  DIContainer.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

struct DIContainer {
    
    static var `default` = Self()
    
    lazy var networkService: NetworkService = NetworkServiceImplementation(session: URLSession.shared)
    lazy var imageService: ImageService = ImageServiceImplementation(session: URLSession.shared, fileManager: RTFileManager())
}
