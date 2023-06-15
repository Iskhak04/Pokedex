//
//  PokemonsPresenter.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

final class PokemonsPresenter {
    
    var view: PokemonsViewProtocol?
    var interactor: PokemonsInteractorProtocol?
    var router: PokemonsRouterProtocol?
    
}

extension PokemonsPresenter: PokemonsPresenterProtocol {
    
}
