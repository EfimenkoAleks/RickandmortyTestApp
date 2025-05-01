//
//  DataFetcher.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 01.05.2025.
//

import Foundation

final class DataFetcher {
    
    let apiService: NetworkService = DIContainer.default.networkService
    let coreData: CoreDataManager = DIContainer.default.coreDataService
    var nextPath: String?
    
    init() {
        nextPath = UserDefaults.standard.value(forKey: "nextPath") as? String
    }
    
    func fetchData(load: Bool, completion: @escaping ([Morty]) -> Void) {
        
        if Connectivity.isConnectedToNetwork() {
            var loadMore: NetworkLoadEvent = .first
            if load == true, let path = nextPath {
                loadMore = .loadMore(path)
            }
            
            apiService.fetchCharacter(load: loadMore) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let models):
                    nextPath = models.info?.next
                    UserDefaults.standard.setValue(nextPath, forKey: "nextPath")
                    coreData.addModel(models: models.results)
                    completion( models.results)
                    break
                case .failure(let error):
                    break
                }
            }
        } else {
            let models = coreData.fetchModel()
            completion(models)
        }
    }
}
