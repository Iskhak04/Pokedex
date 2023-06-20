//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

final class PokemonStats {
    
    static let shared = PokemonStats()
    
    let maxHp = 255 //Blissey #242
    let maxAttack = 150 //Rayquaza #384
    let maxDefense = 230 //Shuckle #213
    let maxSpAtk = 154 //MewTwo #150
    let maxSpDef = 230 //Shuckle #213
    let maxSpeed = 160 //Ninjask #291
    let maxTotal = 680 //MewTwo #150, Rayquaza #384
    
    private init() {}
}
