//
//  FileManager.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import UIKit

final class RTFileManager: NSObject {

    private let fileManager = FileManager.default
    
    func getImageUrl(name: String) -> UIImage? {
        
        guard let documentsDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil}
        let fileName = name
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        let image = UIImage(contentsOfFile: fileURL.path)

        return image
    }
    
    func getFileUrlFromPath(_ path: String) -> URL? {
     
        guard let documentsDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil}
        let fileURL = documentsDirectory.appendingPathComponent(path)
        return fileURL
    }
    
    func saveData(_ data: Data, path: String) {
        
        guard let fileURL = getFileUrlFromPath(path) else { return }
        
        if !fileManager.fileExists(atPath: fileURL.path) {
            do {
                try data.write(to: fileURL)
                print("sucsses")
            } catch {
                print("error")
            }
        }
    }
}
