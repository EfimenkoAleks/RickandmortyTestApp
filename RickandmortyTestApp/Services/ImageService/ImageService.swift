//
//  ImageService.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

protocol ImageService {
    func downloadImage(url: URL, completionHandler: @escaping (UIImage?) -> Void)
}

