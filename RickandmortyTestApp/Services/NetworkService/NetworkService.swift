//
//  NetworkService.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 30.04.2025.
//

import Foundation

protocol NetworkService: AnyObject {
    func fetchCharacter(load: NetworkLoadEvent, completionHandler: @escaping (Result<MortyModel, Error>) -> Void)
}
