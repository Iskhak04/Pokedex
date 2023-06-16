//
//  PokemonsInteractor.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import Alamofire

final class PokemonsInteractor {
    
    var presenter: PokemonsPresenterProtocol?
    
}

extension PokemonsInteractor: PokemonsInteractorProtocol {
    
    func getPokemons() {
        let urlString = "https://pokeapi.co/api/v2/pokemon/pikachu"
        
        let request = AF.request(urlString)
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        request.responseDecodable(of: PokemonModel.self, decoder: decoder   ) { (response) in
          guard let pokemon = response.value else {
              print("no data")
              return
          }
            
            
            print(pokemon.name)
        }
    }

}
