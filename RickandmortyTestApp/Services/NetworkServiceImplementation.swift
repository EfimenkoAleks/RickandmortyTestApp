//
//  NetworkServiceImplementation.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

enum NetworkLoadEvent {
    case first
    case loadMore(String)
}

final class NetworkServiceImplementation {
    
    private var session: URLSession
    private let encoder = JSONEncoder()
    private let baseUrl = "https://rickandmortyapi.com/api"
    private let firstPage = "/character"
    
    init(session: URLSession) {
        self.session = session
    }
}

extension NetworkServiceImplementation: NetworkService {
    
    func fetchCharacter(load: NetworkLoadEvent, completionHandler: @escaping (Result<MortyModel, Error>) -> Void) {
        
        var urlStr = baseUrl// + "/character"
        
        switch load {
        case .first:
            urlStr = urlStr + firstPage
        case .loadMore(let more):
            urlStr = more
        }
        
        let completionBlock: (Result<MortyModel, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
        
        guard let url = URL(string: urlStr) else {
            completionBlock(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        
        let task = self.session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            // Handle networking errors
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            // Check HTTP response status
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionBlock(.failure(URLError(.badServerResponse)))
                return
            }
            
            // Parse JSON data
            guard let data = data else {
                completionBlock(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(MortyModel.self, from: data)
                completionBlock(.success(model))
            } catch {
                completionBlock(.failure(error))
            }
        }
        task.resume()
    }
}
