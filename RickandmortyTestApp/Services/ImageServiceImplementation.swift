//
//  ImageServiceImplementation.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class ImageServiceImplementation {
    
    private var session: URLSession
    private var fileManager: RTFileManager

    init(session: URLSession, fileManager: RTFileManager) {
        self.session = session
        self.fileManager = fileManager
    }
}

extension ImageServiceImplementation: ImageService {
    func downloadImage(url: URL, completionHandler: @escaping (UIImage?) -> Void) {
        guard fileManager.getImageUrl(name: url.lastPathComponent) == nil else {
            completionHandler(fileManager.getImageUrl(name: url.lastPathComponent))
            return
        }
        
        let completionBlock: (UIImage?) -> Void = { image in
            DispatchQueue.main.async {
                completionHandler(image)
            }
        }
        
        let task = self.session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let _ = error {
                completionBlock(nil)
                return
            }
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                completionBlock(nil)
                return
            }
            
            self.fileManager.saveData(data, path: url.lastPathComponent)
            completionBlock(image)
        }
        
        task.resume()
    }
}

