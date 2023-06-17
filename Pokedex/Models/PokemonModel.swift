//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

struct PokemonModel: Codable {
    let abilities: [AbilityModule]
    let baseExperience: Int?
    let forms: [Forms]
    let gameIndices: [GameIndices]
    let height: Int
    let heldItems: [HeldItems]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Moves]
    let name: String
    let order: Int
//    let pastAbilities: []
//    let pastTypes: []
    let species: PokemonSpecies
    let sprites: PokemonSprite
    let stats: [StatsDetails]
    let types: [TypesDetails]
    let weight: Int
}

//MARK: abilities
struct AbilityModule: Codable {
    let ability: Ability
    let isHidden: Bool
    let slot: Int
}

struct Ability: Codable {
    let name: String
    let url: String
}

//MARK: forms
struct Forms: Codable {
    let name: String
    let url: String
}

//MARK: gameIndices
struct GameIndices: Codable {
    let gameIndex: Int
    let version: GameIndicesVersion
}

struct GameIndicesVersion: Codable {
    let name: String
    let url: String
}

//MARK: heldItems
struct HeldItems: Codable {
    let item: Item
    let versionDetails: [VersionDetails]
}

struct VersionDetails: Codable {
    let rarity: Int
    let version: HeldItemsVersion
}

struct HeldItemsVersion: Codable {
    let name: String
    let url: String
}

struct Item: Codable {
    let name: String
    let url: String
}

//MARK: moves
struct Moves: Codable {
    let move: MoveDetails
    let versionGroupDetails: [VersionGroupDetails]
}

struct VersionGroupDetails: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod: MoveLearnMethod
    let versionGroup: MoveVersionGroup
}

struct MoveVersionGroup: Codable {
    let name: String
    let url: String
}

struct MoveLearnMethod: Codable {
    let name: String
    let url: String
}

struct MoveDetails: Codable {
    let name: String
    let url: String
}

//MARK: pokemonSpecies
struct PokemonSpecies: Codable {
    let name: String
    let url: String
}

//MARK: stats
struct StatsDetailsName: Codable {
    let name: String
    let url: String
}

struct StatsDetails: Codable {
    let baseStat: Int
    let effort: Int
    let stat: StatsDetailsName
}

//MARK: types
struct TypesDetailsName: Codable {
    let name: String
    let url: String
}

struct TypesDetails: Codable {
    let slot: Int
    let type: TypesDetailsName
}

//MARK: sprites
struct PokemonSprite: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: PokemonOtherSprites
    let versions: PokemonVersionSprites
}

struct PokemonVersionSprites: Codable {
    let generationI: GenerationISprites
    let generationII: GenerationIISprites
    let generationIII: GenerationIIISprites
    let generationIV: GenerationIVSprites
    let generationV: GenerationVSprites
    let generationVI: GenerationVISprites
    let generationVII: GenerationVIISprites
    let generationVIII: GenerationVIIISprites
    
    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationII = "generation-ii"
        case generationIII = "generation-iii"
        case generationIV = "generation-iv"
        case generationV = "generation-v"
        case generationVI = "generation-vi"
        case generationVII = "generation-vii"
        case generationVIII = "generation-viii"
    }
}

struct GenerationVIIISprites: Codable {
    let icons: iconsSprites
}

struct GenerationVIISprites: Codable {
    let icons: iconsSprites
    let ultraSunUltraMoon: ultraSunUltraMoonSprites
    
    enum CodingKeys: String, CodingKey {
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
        case icons
    }
}

struct ultraSunUltraMoonSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct iconsSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
}

struct GenerationVISprites: Codable {
    let omegarubyAlphasapphire: omegarubyAlphasapphireSprites
    let xy: xySprites
    
    enum CodingKeys: String, CodingKey {
        case omegarubyAlphasapphire = "omegaruby-alphasapphire"
        case xy = "x-y"
    }
}

struct xySprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct omegarubyAlphasapphireSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct GenerationVSprites: Codable {
    let blackWhite: blackWhiteSprites
    
    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

struct blackWhiteSprites: Codable {
    let animated: blackWhiteAnimatedGifs
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct blackWhiteAnimatedGifs: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct GenerationIVSprites: Codable {
    let diamondPearl: diamondPearlSprites
    let heartgoldSoulsilver: heartgoldSoulsilverSprites
    let platinum: platinumSprites
    
    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

struct platinumSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct heartgoldSoulsilverSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct diamondPearlSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct GenerationIIISprites: Codable {
    let emerald: EmeraldSprites
    let fireredLeafgreen: FireredLeafgreenSprites
    let rubySapphire: RubySapphireSprites
    
    enum CodingKeys: String, CodingKey {
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
        case emerald
    }
}

struct RubySapphireSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

struct EmeraldSprites: Codable {
    let frontDefault: String?
    let frontShiny: String?
}

struct FireredLeafgreenSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

struct GenerationIISprites: Codable {
    let crystal: CrystalSprites
    let gold: GoldSprites
    let silver: SilverSprites
}

struct SilverSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let frontTransparent: String?
}

struct GoldSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let frontTransparent: String?
}

struct CrystalSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let backShinyTransparent: String?
    let backTransparent: String?
    let frontDefault: String?
    let frontShiny: String?
    let frontShinyTransparent: String?
    let frontTransparent: String?
}

struct GenerationISprites: Codable {
    let redBlue: RedBlueSprites
    let yellow: YellowSprites
    
    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

struct YellowSprites: Codable {
    let backDefault: String?
    let backGray: String?
    let backTransparent: String?
    let frontDefault: String?
    let frontGray: String?
    let frontTransparent: String?
}

struct RedBlueSprites: Codable {
    let backDefault: String?
    let backGray: String?
    let backTransparent: String?
    let frontDefault: String?
    let frontGray: String?
    let frontTransparent: String?
}

struct PokemonOtherSprites: Codable {
    let dreamWorld: DreamWorldSprites
    let home: HomeSprites
    var officialArtwork: OfficialArtworkSprites
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
        case dreamWorld
        case home
    }
}

struct DreamWorldSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
}

struct HomeSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct OfficialArtworkSprites: Codable {
    let frontDefault: String?
    let frontShiny: String?
}
