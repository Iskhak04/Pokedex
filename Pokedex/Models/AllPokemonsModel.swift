//
//  AllPokemonsModel.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 16.06.23.
//

struct AllPokemonsModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [ResultsDetails]
}

struct ResultsDetails: Codable {
    let name: String
    let url: String
}
