//
//  PokemonsInteractor.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit
import Alamofire

final class PokemonsInteractor {
    
    var presenter: PokemonsPresenterProtocol?
    let maxLimit = 1281
    let maxPokemons = 1280
    
}

extension PokemonsInteractor: PokemonsInteractorProtocol {
    
    func getPokemons(offset: Int, limit: Int, imageWidth: Double, imageHeight: Double) {
        
        NetworkLayer.shared.fetchAllPokemons(offset: offset, limit: limit) { allPokemonsModel in

            Task {
                var allPokemons: [PokemonModel] = []
                var allImages: [UIImageView] = []
                
                do {
                    for i in 0..<allPokemonsModel.results.count {
                        let pokemon = try await NetworkLayer.shared.fetchSinglePokemon(urlString: allPokemonsModel.results[i].url)
                        
                        guard let svgImageString = pokemon.sprites.other.dreamWorld.frontDefault else { return }
                        
                        
                        NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: 80, height: 80,completion: { imageV in
                            allImages.append(imageV)
                        })
                        
                        allPokemons.append(pokemon)
                    }
                    
                    self.presenter?.fetchedPokemons(allPokemons: allPokemons, allImages: allImages)
                } catch let error {
                    print(String(describing: error))
                }
            }
            
        }
        
    }

}


