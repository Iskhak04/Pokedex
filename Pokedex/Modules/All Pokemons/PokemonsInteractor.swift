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
    
    func getPokemons(offset: Int, limit: Int) {
        
        fetchAllPokemons(offset: offset, limit: limit) { allPokemonsModel in

            Task {
                var allPokemons: [PokemonModel] = []
                var allImages: [UIImageView] = []
                
                do {
                    for i in 0..<allPokemonsModel.results.count {
                        let pokemon = try await fetchSinglePokemon(urlString: allPokemonsModel.results[i].url)
                        
                        guard let svgImageString = pokemon.sprites.other.dreamWorld.frontDefault else { return }
                        
                        
                        downloadSvg(svgString: svgImageString, completion: { imageV in
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

private func fetchSinglePokemon(urlString: String) async throws -> PokemonModel {
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    return try await AF.request(urlString, method: .get).serializingDecodable(PokemonModel.self, decoder: decoder).value
}

private func fetchAllPokemons(offset: Int, limit: Int, completion: @escaping (AllPokemonsModel) -> Void) {
    
    let allPokemonsUrlString = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=\(limit)"
    
    let request = AF.request(allPokemonsUrlString)
    
    request.responseDecodable(of: AllPokemonsModel.self) { (response) in
        guard let pokemons = response.value else {
          print("no data")
          return
        }
        
        completion(pokemons)
    }
}

private func downloadSvg(svgString: String, completion: @escaping (UIImageView) -> Void) {
    
    guard let svgUrl = URL(string: svgString) else { return }
    
    let imageView = UIImageView(SVGURL: svgUrl) { (svgLayer) in
        svgLayer.resizeToFit(CGRect(x: 0, y: 0, width: 80, height: 80))
    }
    
    completion(imageView)
}

private func downloadImage(imageString: String) async throws -> UIImage {
    guard let imageUrl = URL(string: imageString) else { throw ErrorModel.invalidUrl }

    let (data, response) = try await URLSession.shared.data(from: imageUrl)

    guard let newResponse = response as? HTTPURLResponse, newResponse.statusCode == 200 else { throw ErrorModel.invalidResponse }

    guard let image = UIImage(data: data) else { throw ErrorModel.invalidData }

    return image
}
