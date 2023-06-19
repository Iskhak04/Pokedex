//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

final class PokemonStats {
    
    static let shared = PokemonStats()
    
    let maxHp = 255
    let maxAttack = 190
    let maxDefense = 230
    let maxSpAtk = 194
    let maxSpDef = 230
    let maxSpeed = 180
    let maxTotal = 720
    
    private init() {}
}
