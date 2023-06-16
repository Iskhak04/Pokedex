//
//  Constants.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 16.06.23.
//

import UIKit

final class Constants {
    
    static let shared = Constants()
    
    let sideOffset = 23
    
    //Fonts
    let pokemonCardNameLabelFont = UIFont(name: Fonts.robotoBold.rawValue, size: 20)
    let pokemonCardTypeButtonFont = UIFont(name: Fonts.robotoMedium.rawValue, size: 14)
    let pokemonCardIdLabelFont = UIFont(name: Fonts.robotoBold.rawValue, size: 18)
    
    
    let pokemonCardGrassColor = UIColor(hex: "#72CDB1")
    let pokemonTypeGrassColor = UIColor(hex: "#85DDCA")
    let pokemonCardIdColor = UIColor(hex: "#58a38c")
    
    
    private init() {}
}
