//
//  DetailedPokemonProtocols.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import UIKit

//Conforms View, Presenter -> View
protocol DetailedPokemonViewProtocol {
    func fetchedPokemon(pokemon: PokemonModel, svgImageView: UIImageView, pokemonSpecies: PokemonSpeciesModel)
}

//Conforms Presenter, View -> Presenter, Interactor -> Presenter
protocol DetailedPokemonPresenterProtocol {
    //View -> Presenter
    func getPokemon(pokemonUrlString: String, imageWidth: Double, imageHeight: Double)
    
    //Interactor -> Presenter
    func fetchedPokemon(pokemon: PokemonModel, svgImageView: UIImageView, pokemonSpecies: PokemonSpeciesModel)
}

//Conforms Interactor, Presenter -> Interactor
protocol DetailedPokemonInteractorProtocol {
    func getPokemon(pokemonUrlString: String, imageWidth: Double, imageHeight: Double)
}

//Conforms Router, Presenter -> Router
protocol DetailedPokemonRouterProtocol {
    
}
