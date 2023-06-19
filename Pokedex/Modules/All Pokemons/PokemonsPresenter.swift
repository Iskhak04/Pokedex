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
    
    func goToDetailedPage() {
        router?.goToDetailedPage()
    }
    
    func fetchedPokemons(allPokemons: [PokemonModel], allImages: [UIImageView]) {
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
            case "normal":
                mainType = .normal
            case "ice":
                mainType = .ice
            case "fighting":
                mainType = .fighting
            case "poison":
                mainType = .poison
            case "ground":
                mainType = .ground
            case "flying":
                mainType = .flying
            case "psychic":
                mainType = .psychic
            case "bug":
                mainType = .bug
            case "rock":
                mainType = .rock
            case "ghost":
                mainType = .ghost
            case "dragon":
                mainType = .dragon
            case "dark":
                mainType = .dark
            case "steel":
                mainType = .steel
            case "fairy":
                mainType = .fairy
            case "unknown":
                mainType = .unknown
            case "shadow":
                mainType = .shadow
            default:
                ()
            }
            
            for j in 0..<allPokemons[i].types.count {
                types.append(allPokemons[i].types[j].type.name)
            }
            
            allFetchedPokemons.append(PokemonViewModel(name: allPokemons[i].name, id: allPokemons[i].id, mainType: mainType, types: types, imageView: allImages[i]))
            
        }
        
        view?.fetchedPokemons(allPokemons: allFetchedPokemons)
    }
    
    
    func getPokemons(offset: Int, limit: Int) {
        interactor?.getPokemons(offset: offset, limit: limit)
    }
    
}
