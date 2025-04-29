//
//  Titles.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import Foundation

enum Titles {
    case tableTitle
}

extension Titles {
    
    var title: String {
        switch self {
        case .tableTitle: return "Rickandmorty"
        }
    }
}
