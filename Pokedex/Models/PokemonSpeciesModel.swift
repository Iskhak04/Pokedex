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
    let evolutionChain: EvolutionChainUrl
    let genderRate: Int //Chance of a pokemon of being a female (max 8) (-1 is genderless)
}

struct EvolutionChainUrl: Codable {
    let url: String
}

struct EggGroups: Codable {
    let name: String
    let url: String
}

struct PokemonColor: Codable {
    let name: String
    let url: String
}
