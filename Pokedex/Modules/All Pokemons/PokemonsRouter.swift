//
//  PokemonsRouter.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit

final class PokemonsRouter {
    
    weak var viewController: UIViewController?
    
}

extension PokemonsRouter: PokemonsRouterProtocol {
    
    func goToDetailedPage() {
        viewController?.navigationController?.pushViewController(DetailedPokemonModuleBuilder().build(), animated: true)
    }
    
}
