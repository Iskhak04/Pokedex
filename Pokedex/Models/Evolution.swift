//
//  Evolution.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 21.06.23.
//

struct Evolution: Codable {
    let chain: EvolutionChain
    let id: Int
}

struct EvolutionChain: Codable {
    let evolutionDetails: [EvolutionDetails?]
    let evolvesTo: [EvolvesTo]
    let isBaby: Bool
    let species: SpeciesModel
}

struct EvolvesTo: Codable {
    let evolutionDetails: [EvolutionDetails?]
    let evolvesTo: [EvolvesTo?]
    let isBaby: Bool
    let species: SpeciesModel
}

struct EvolutionDetails: Codable {
    let minLevel: Int
}

struct SpeciesModel: Codable {
    let name: String
    let url: String
}
