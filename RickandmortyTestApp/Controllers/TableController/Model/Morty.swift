//
//  Morty.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import Foundation

struct Morty: Decodable {
    var image: String?
    var name: String?
    var id: Int?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
}

struct MortyModel: Decodable {
    var info: MortyInfo?
    var results: [Morty]
}

struct MortyInfo: Decodable {
    var next: String?
    var prev: String?
}
