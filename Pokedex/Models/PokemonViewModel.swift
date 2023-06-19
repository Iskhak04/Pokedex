//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 16.06.23.
//

import UIKit

struct PokemonViewModel {
    let name: String
    let id: Int
    let url: String
    let mainType: PokemonTypes
    let types: [String]
    let imageView: UIImageView
}
