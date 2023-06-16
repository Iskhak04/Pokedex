//
//  PokemonsProtocols.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit

//Conforms View, Presenter -> View
protocol PokemonsViewProtocol {
    func fetchedPokemons(allPokemons: [PokemonViewModel])
}

//Conforms Presenter, View -> Presenter, Interactor -> Presenter
protocol PokemonsPresenterProtocol {
    //View -> Presenter
    func getPokemons(offset: Int, limit: Int)
    
    //Interactor -> Presenter
    func fetchedPokemons(allPokemons: [PokemonModel], allImages: [UIImage])
}

//Conforms Interactor, Presenter -> Interactor
protocol PokemonsInteractorProtocol {
    func getPokemons(offset: Int, limit: Int)
}

//Conforms Router, Presenter -> Router
protocol PokemonsRouterProtocol {
    
}
