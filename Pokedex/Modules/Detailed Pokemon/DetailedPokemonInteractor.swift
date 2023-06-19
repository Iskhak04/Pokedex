//
//  DetailedPokemonInteractor.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import Alamofire

final class DetailedPokemonInteractor {
    
    var presenter: DetailedPokemonPresenterProtocol?
    
}

extension DetailedPokemonInteractor: DetailedPokemonInteractorProtocol {
    
    func getPokemon(pokemonUrlString: String, imageWidth: Double, imageHeight: Double) {
            
        Task {
            do {
                var images: [UIImageView] = []
                
                let pokemon = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemonUrlString)
                
                guard let svgImageString = pokemon.sprites.other.dreamWorld.frontDefault else { return }
                
                
                NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: imageWidth, height: imageHeight, completion: { imageV in
                    images.append(imageV)
                })
    
                self.presenter?.fetchedPokemon(pokemon: pokemon, svgImageView: images[0])
            } catch {
                
            }
        }
    }
    
}
