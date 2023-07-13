//
//  DetailedPokemonPresenter.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import UIKit

final class DetailedPokemonPresenter {
    
    var view: DetailedPokemonViewProtocol?
    var interactor: DetailedPokemonInteractorProtocol?
    var router: DetailedPokemonRouterProtocol?
    
}

extension DetailedPokemonPresenter: DetailedPokemonPresenterProtocol {
    
    func fetchedPokemon(pokemon: PokemonModel, svgImageView: UIImageView, pokemonSpecies: PokemonSpeciesModel, evolutionChain: EvolutionViewModel, moves: [MoveModel]) {
        view?.fetchedPokemon(pokemon: pokemon, svgImageView: svgImageView, pokemonSpecies: pokemonSpecies, evolutionChain: evolutionChain, moves: moves)
    }
    
    func getPokemon(pokemonUrlString: String, imageWidth: Double, imageHeight: Double) {
        interactor?.getPokemon(pokemonUrlString: pokemonUrlString, imageWidth: imageWidth, imageHeight: imageHeight)
    }
    
}
