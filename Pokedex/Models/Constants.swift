//
//  Constants.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 16.06.23.
//

import UIKit

final class Constants {
    
    static let shared = Constants()
    
    let sideOffset = 22
    
    //Fonts
    let pokemonCardNameLabelFont = UIFont(name: Fonts.robotoBold.rawValue, size: 20)
    let pokemonCardTypeButtonFont = UIFont(name: Fonts.robotoMedium.rawValue, size: 14)
    let pokemonCardIdLabelFont = UIFont(name: Fonts.robotoBold.rawValue, size: 18)
    
    
    
    //Grass
    let pokemonCardGrassColor = UIColor(hex: "#7AC74C")
    let pokemonTypeGrassColor = UIColor(hex: "#83d651")
    let pokemonCardGrassIdColor = UIColor(hex: "#578f36")
    
    //Fire
    let pokemonCardFireColor = UIColor(hex: "#d44442")
    let pokemonTypeFireColor = UIColor(hex: "#ff5754")
    let pokemonCardFireIdColor = UIColor(hex: "#a13332")
    
    //Water
    let pokemonCardWaterColor = UIColor(hex: "#577dcf")
    let pokemonTypeWaterColor = UIColor(hex: "#6a98fc")
    let pokemonCardWaterIdColor = UIColor(hex: "#435f9c")
    
    //Electric
    let pokemonCardElectricColor = UIColor(hex: "#ffcd00")
    let pokemonTypeElectricColor = UIColor(hex: "#ffdd52")
    let pokemonCardElectricIdColor = UIColor(hex: "#c9a200")
    
    //Normal
    let pokemonCardNormalColor = UIColor(hex: "#A8A77A")
    let pokemonTypeNormalColor = UIColor(hex: "#c9c893")
    let pokemonCardNormalIdColor = UIColor(hex: "#878663")
    
    //Poison
    let pokemonCardPoisonColor = UIColor(hex: "#A33EA1")
    let pokemonTypePoisonColor = UIColor(hex: "#cf4ecc")
    let pokemonCardPoisonIdColor = UIColor(hex: "#6e2a6d")
    
    //Bug
    let pokemonCardBugColor = UIColor(hex: "#A6B91A")
    let pokemonTypeBugColor = UIColor(hex: "#c0d61e")
    let pokemonCardBugIdColor = UIColor(hex: "#859415")
    
    //Fighting
    let pokemonCardFightingColor = UIColor(hex: "#8a3332")
    let pokemonTypeFightingColor = UIColor(hex: "#ad403e")
    let pokemonCardFightingIdColor = UIColor(hex: "#632524")
    
    //Flying
    let pokemonCardFlyingColor = UIColor(hex: "#A98FF3")
    let pokemonTypeFlyingColor = UIColor(hex: "#b9a4f5")
    let pokemonCardFlyingIdColor = UIColor(hex: "#9776f5")
    
    //Ground
    let pokemonCardGroundColor = UIColor(hex: "#E2BF65")
    let pokemonTypeGroundColor = UIColor(hex: "#edd391")
    let pokemonCardGroundIdColor = UIColor(hex: "#c49a2f")
    
    //Fairy
    let pokemonCardFairyColor = UIColor(hex: "#D685AD")
    let pokemonTypeFairyColor = UIColor(hex: "#e3a1c2")
    let pokemonCardFairyIdColor = UIColor(hex: "#bd5588")
    
    //Psychic
    let pokemonCardPsychicColor = UIColor(hex: "#F95587")
    let pokemonTypePsychicColor = UIColor(hex: "#ff82a8")
    let pokemonCardPsychicIdColor = UIColor(hex: "#db275e")
    
    //Rock
    let pokemonCardRockColor = UIColor(hex: "#B6A136")
    let pokemonTypeRockColor = UIColor(hex: "#c9b861")
    let pokemonCardRockIdColor = UIColor(hex: "#917f1f")
    
    //Ghost
    let pokemonCardGhostColor = UIColor(hex: "#735797")
    let pokemonTypeGhostColor = UIColor(hex: "#9677bf")
    let pokemonCardGhostIdColor = UIColor(hex: "#533778")
    
    //Ice
    let pokemonCardIceColor = UIColor(hex: "#6bdbd6")
    let pokemonTypeIceColor = UIColor(hex: "#92f0ec")
    let pokemonCardIceIdColor = UIColor(hex: "#43bfba")
    
    //Dragon
    let pokemonCardDragonColor = UIColor(hex: "#6F35FC")
    let pokemonTypeDragonColor = UIColor(hex: "#8a5cfa")
    let pokemonCardDragonIdColor = UIColor(hex: "#4b16cc")
    
    //Dark
    let pokemonCardDarkColor = UIColor(hex: "#705746")
    let pokemonTypeDarkColor = UIColor(hex: "#a88268")
    let pokemonCardDarkIdColor = UIColor(hex: "#523b2b")
    
    //Steel
    let pokemonCardSteelColor = UIColor(hex: "#B7B7CE")
    let pokemonTypeSteelColor = UIColor(hex: "#d7d7db")
    let pokemonCardSteelIdColor = UIColor(hex: "#9090a3")
    
    //Shadow
    let pokemonCardShadowColor = UIColor(hex: "#F9D87F")
    let pokemonTypeShadowColor = UIColor(hex: "#FBE78D")
    let pokemonCardShadowIdColor = UIColor(hex: "#a38d52")
    
    //Unknown
    let pokemonCardUnknownColor = UIColor(hex: "#F9D87F")
    let pokemonTypeUnknownColor = UIColor(hex: "#FBE78D")
    let pokemonCardUnknownIdColor = UIColor(hex: "#a38d52")
    
    func defineBackgroundColor(type: PokemonTypes) -> (UIColor, UIColor, UIColor) {
        var cardBackgroundColor: UIColor?
        var cardTypeBackgroundColor: UIColor?
        var cardIdColor: UIColor?
        
        switch type {
        case .electric:
            cardBackgroundColor = Constants.shared.pokemonCardElectricColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeElectricColor
            cardIdColor = Constants.shared.pokemonCardElectricIdColor
        case .grass:
            cardBackgroundColor = Constants.shared.pokemonCardGrassColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeGrassColor
            cardIdColor = Constants.shared.pokemonCardGrassIdColor
        case .water:
            cardBackgroundColor = Constants.shared.pokemonCardWaterColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeWaterColor
            cardIdColor = Constants.shared.pokemonCardWaterIdColor
        case .fire:
            cardBackgroundColor = Constants.shared.pokemonCardFireColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeFireColor
            cardIdColor = Constants.shared.pokemonCardFireIdColor
        case .bug:
            cardBackgroundColor = Constants.shared.pokemonCardBugColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeBugColor
            cardIdColor = Constants.shared.pokemonCardBugIdColor
        case .dark:
            cardBackgroundColor = Constants.shared.pokemonCardDarkColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeDarkColor
            cardIdColor = Constants.shared.pokemonCardDarkIdColor
        case .dragon:
            cardBackgroundColor = Constants.shared.pokemonCardDragonColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeDragonColor
            cardIdColor = Constants.shared.pokemonCardDragonIdColor
        case .fairy:
            cardBackgroundColor = Constants.shared.pokemonCardFairyColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeFairyColor
            cardIdColor = Constants.shared.pokemonCardFairyIdColor
        case .fighting:
            cardBackgroundColor = Constants.shared.pokemonCardFightingColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeFightingColor
            cardIdColor = Constants.shared.pokemonCardFightingIdColor
        case .flying:
            cardBackgroundColor = Constants.shared.pokemonCardFlyingColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeFlyingColor
            cardIdColor = Constants.shared.pokemonCardFlyingIdColor
        case .ghost:
            cardBackgroundColor = Constants.shared.pokemonCardGhostColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeGhostColor
            cardIdColor = Constants.shared.pokemonCardGhostIdColor
        case .ground:
            cardBackgroundColor = Constants.shared.pokemonCardGroundColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeGroundColor
            cardIdColor = Constants.shared.pokemonCardGroundIdColor
        case .ice:
            cardBackgroundColor = Constants.shared.pokemonCardIceColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeIceColor
            cardIdColor = Constants.shared.pokemonCardIceIdColor
        case .normal:
            cardBackgroundColor = Constants.shared.pokemonCardNormalColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeNormalColor
            cardIdColor = Constants.shared.pokemonCardNormalIdColor
        case .poison:
            cardBackgroundColor = Constants.shared.pokemonCardPoisonColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypePoisonColor
            cardIdColor = Constants.shared.pokemonCardPoisonIdColor
        case .psychic:
            cardBackgroundColor = Constants.shared.pokemonCardPsychicColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypePsychicColor
            cardIdColor = Constants.shared.pokemonCardPsychicIdColor
        case .rock:
            cardBackgroundColor = Constants.shared.pokemonCardRockColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeRockColor
            cardIdColor = Constants.shared.pokemonCardRockIdColor
        case .shadow:
            cardBackgroundColor = Constants.shared.pokemonCardShadowColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeShadowColor
            cardIdColor = Constants.shared.pokemonCardShadowIdColor
        case .steel:
            cardBackgroundColor = Constants.shared.pokemonCardSteelColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeSteelColor
            cardIdColor = Constants.shared.pokemonCardSteelIdColor
        case .unknown:
            cardBackgroundColor = Constants.shared.pokemonCardUnknownColor
            cardTypeBackgroundColor = Constants.shared.pokemonTypeUnknownColor
            cardIdColor = Constants.shared.pokemonCardUnknownIdColor
        }
        
        return (cardBackgroundColor!, cardTypeBackgroundColor!, cardIdColor!)
    }
    
    private init() {}
}
