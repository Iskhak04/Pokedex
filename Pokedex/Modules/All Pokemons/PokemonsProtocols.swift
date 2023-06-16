//
//  PokemonsProtocols.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

//Conforms View, Presenter -> View
protocol PokemonsViewProtocol {
    
}

//Conforms Presenter, View -> Presenter, Interactor -> Presenter
protocol PokemonsPresenterProtocol {
    //View -> Presenter
    func getPokemons()
    
    //Interactor -> Presenter
}

//Conforms Interactor, Presenter -> Interactor
protocol PokemonsInteractorProtocol {
    func getPokemons()
}

//Conforms Router, Presenter -> Router
protocol PokemonsRouterProtocol {
    
}
