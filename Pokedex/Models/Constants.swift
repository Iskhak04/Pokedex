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
    
    
    
    //Grass
    let pokemonCardGrassColor = UIColor(hex: "#72CDB1")
    let pokemonTypeGrassColor = UIColor(hex: "#85DDCA")
    let pokemonCardGrassIdColor = UIColor(hex: "#58a38c")
    
    //Fire
    let pokemonCardFireColor = UIColor(hex: "#EA7571")
    let pokemonTypeFireColor = UIColor(hex: "#EA918F")
    let pokemonCardFireIdColor = UIColor(hex: "#a34c4b")
    
    //Water
    let pokemonCardWaterColor = UIColor(hex: "#87BCF8")
    let pokemonTypeWaterColor = UIColor(hex: "#9FCEFB")
    let pokemonCardWaterIdColor = UIColor(hex: "#5579a3")
    
    //Electric
    let pokemonCardElectricColor = UIColor(hex: "#F9D87F")
    let pokemonTypeElectricColor = UIColor(hex: "#FBE78D")
    let pokemonCardElectricIdColor = UIColor(hex: "#a38d52")
    
    private init() {}
}
