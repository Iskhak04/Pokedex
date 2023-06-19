//
//  DetailedPokemonPresenter.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

final class DetailedPokemonPresenter {
    
    var view: DetailedPokemonViewProtocol?
    var interactor: DetailedPokemonInteractorProtocol?
    var router: DetailedPokemonRouterProtocol?
    
}

extension DetailedPokemonPresenter: DetailedPokemonPresenterProtocol {
    
}
