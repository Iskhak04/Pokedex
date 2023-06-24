//
//  NetworkLayer.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

import UIKit
import Alamofire

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    func fetchPokemonEvolution(urlString: String) async throws -> Evolution {
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        return try await AF.request(urlString, method: .get).serializingDecodable(Evolution.self, decoder: decoder).value
    }
    
    func fetchPokemonSpecies(urlString: String) async throws -> PokemonSpeciesModel {
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        return try await AF.request(urlString, method: .get).serializingDecodable(PokemonSpeciesModel.self, decoder: decoder).value
    }
    
    func fetchSinglePokemon(urlString: String) async throws -> PokemonModel {
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        return try await AF.request(urlString, method: .get).serializingDecodable(PokemonModel.self, decoder: decoder).value
    }

    func fetchAllPokemons(offset: Int, limit: Int, completion: @escaping (AllPokemonsModel) -> Void) {
        
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

    func downloadSvg(svgString: String, width: Double, height: Double, completion: @escaping (UIImageView) -> Void) {
        
        guard let svgUrl = URL(string: svgString) else { return }
        
        let imageView = UIImageView(SVGURL: svgUrl) { (svgLayer) in
            svgLayer.resizeToFit(CGRect(x: 0, y: 0, width: width, height: height))
        }
        
        completion(imageView)
    }

    func downloadImage(imageString: String) async throws -> UIImage {
        guard let imageUrl = URL(string: imageString) else { throw ErrorModel.invalidUrl }

        let (data, response) = try await URLSession.shared.data(from: imageUrl)

        guard let newResponse = response as? HTTPURLResponse, newResponse.statusCode == 200 else { throw ErrorModel.invalidResponse }

        guard let image = UIImage(data: data) else { throw ErrorModel.invalidData }

        return image
    }
    
    
    
    
    private init() {}
}
