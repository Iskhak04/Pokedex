//
//  PokemonSpeciesModel.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 20.06.23.
//

struct PokemonSpeciesModel: Codable {
    let baseHappiness: Int
    let captureRate: Int
    let color: PokemonColor
    let eggGroups: [EggGroups]
    let genderRate: Int //Chance of a pokemon of being a female (max 8) (-1 is genderless)
}

struct EggGroups: Codable {
    let name: String
    let url: String
}

struct PokemonColor: Codable {
    let name: String
    let url: String
}
