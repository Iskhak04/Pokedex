//
//  PokemonsPresenter.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit

final class PokemonsPresenter {
    
    var view: PokemonsViewProtocol?
    var interactor: PokemonsInteractorProtocol?
    var router: PokemonsRouterProtocol?
    
}

extension PokemonsPresenter: PokemonsPresenterProtocol {
    
    func fetchedPokemons(allPokemons: [PokemonModel], allImages: [UIImage]) {
        var allFetchedPokemons: [PokemonViewModel] = []
        
        for i in 0..<allPokemons.count {
            var types: [String] = []
            var mainType: PokemonTypes = .grass
            
            switch allPokemons[i].types[0].type.name {
            case "grass":
                mainType = .grass
            case "fire":
                mainType = .fire
            case "water":
                mainType = .water
            case "electric":
                mainType = .electric
            default:
                ()
            }
            
            for j in 0..<allPokemons[i].types.count {
                types.append(allPokemons[i].types[j].type.name)
            }
            
            allFetchedPokemons.append(PokemonViewModel(name: allPokemons[i].name, id: allPokemons[i].id, mainType: mainType, types: types, image: allImages[i]))
            
        }
        view?.fetchedPokemons(allPokemons: allFetchedPokemons)
    }
    
    
    func getPokemons(offset: Int, limit: Int) {
        interactor?.getPokemons(offset: offset, limit: limit)
    }
    
}
