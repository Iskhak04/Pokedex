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
                                
                print(pokemonUrlString)
                let pokemon = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemonUrlString)
                
                let species = try await NetworkLayer.shared.fetchPokemonSpecies(urlString: pokemon.species.url)
                
                let evolution = try await NetworkLayer.shared.fetchPokemonEvolution(urlString: species.evolutionChain.url)
                
                guard let svgImageString = pokemon.sprites.other.dreamWorld.frontDefault else { return }
                
                let pokemon1Url = "https://pokeapi.co/api/v2/pokemon/\(evolution.chain.species.name)"
                print(evolution.chain.species.name)
                print(pokemon1Url)
                let pokemon2Url = "https://pokeapi.co/api/v2/pokemon/\(evolution.chain.evolvesTo[0].species.name)"
                if evolution.chain.evolvesTo[0].evolvesTo.count != 0 {
                    print("!=0")
                    let pokemon3Url = "https://pokeapi.co/api/v2/pokemon/\(evolution.chain.evolvesTo[0].evolvesTo[0]!.species.name)"
                    let firstLevel = evolution.chain.evolvesTo[0].evolutionDetails[0]!.minLevel
                    let secondLevel = (evolution.chain.evolvesTo[0].evolvesTo[0]?.evolutionDetails[0]!.minLevel)!
                    
                    let pokemon1 = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemon1Url)
                    let pokemon2 = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemon2Url)
                    let pokemon3 = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemon3Url)
                    
                    NetworkLayer.shared.downloadSvg(svgString: pokemon1.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV1 in
                        
                        
                        NetworkLayer.shared.downloadSvg(svgString: pokemon2.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV2 in
                            
                            
                            NetworkLayer.shared.downloadSvg(svgString: pokemon3.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV3 in
                                
                                
                                NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: imageWidth, height: imageHeight, completion: { imageV4 in
                                    images.append(imageV4)
                                    
                                    NetworkLayer.shared.downloadSvg(svgString: pokemon2.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV22 in
                                        
                                        NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: 100, height: 100) { imageV11 in
                                            self.presenter?.fetchedPokemon(pokemon: pokemon, svgImageView: images[0], pokemonSpecies: species, evolutionChain: EvolutionViewModel(firstPokemonTypeImageView: imageV1, secondPokemonTypeImageView: imageV2, thirdPokemonTypeImageView: imageV22, fourthPokemonTypeImageView: imageV3, firstLevel: firstLevel, secondLevel: secondLevel))
                                        }
                                        
                                    }
                                    
                                    
                                })
                            }
                        }
                    }
                } else {

                    let firstLevel = evolution.chain.evolvesTo[0].evolutionDetails[0]!.minLevel
                    
                    let pokemon1 = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemon1Url)
                    let pokemon2 = try await NetworkLayer.shared.fetchSinglePokemon(urlString: pokemon2Url)
                    
                    NetworkLayer.shared.downloadSvg(svgString: pokemon1.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV1 in
                        
                        
                        NetworkLayer.shared.downloadSvg(svgString: pokemon2.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV2 in
                                
                                
                                NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: imageWidth, height: imageHeight, completion: { imageV4 in
                                    images.append(imageV4)
                                    
                                    NetworkLayer.shared.downloadSvg(svgString: pokemon2.sprites.other.dreamWorld.frontDefault!, width: 100, height: 100) { imageV22 in
                                        
                                        NetworkLayer.shared.downloadSvg(svgString: svgImageString, width: 100, height: 100) { imageV11 in
                                            self.presenter?.fetchedPokemon(pokemon: pokemon, svgImageView: images[0], pokemonSpecies: species, evolutionChain: EvolutionViewModel(firstPokemonTypeImageView: imageV1, secondPokemonTypeImageView: imageV2, thirdPokemonTypeImageView: imageV22, fourthPokemonTypeImageView: nil, firstLevel: firstLevel, secondLevel: nil))
                                        }
                                        
                                    }
                                    
                                    
                                })
                            
                        }
                    }
                }
                
                
                
            } catch {
                
            }
        }
    }
    
}


