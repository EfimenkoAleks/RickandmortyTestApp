//
//  DetailViewModel.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class DetailViewModel: DetailViewModelInterface {
 
    var model: Morty?
    private var imageService: ImageService?
    weak var coordinator: DetailCoordinatorInterface?
   
    init(coordinator: DetailCoordinatorInterface,
         imageService: ImageService = DIContainer.default.imageService) {
        self.coordinator = coordinator
        self.imageService = imageService
    }
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        guard let strImage = model?.image,
              let url = URL(string: strImage) else {
            completion(nil)
            return
        }
        imageService?.downloadImage(url: url) { image in
             completion(image)
        }
    }
}
