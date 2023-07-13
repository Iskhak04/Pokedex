//
//  MoveModel.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 28.06.23.
//

struct MoveModel: Codable {
    let id: Int
    let name: String
    let accuracy: Int
    let pp: Int
    let priority: Int
    let power: Int
    let damageClass: DamageClass
    let type: MoveType
}

struct MoveType: Codable {
    let name: String
    let url: String
}

struct DamageClass: Codable {
    let name: String
    let url: String
}
