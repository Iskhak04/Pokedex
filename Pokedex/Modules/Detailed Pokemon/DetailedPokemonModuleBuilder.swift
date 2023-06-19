//
//  DetailedPokemonModuleBuilder.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import UIKit

final class DetailedPokemonModuleBuilder {
    func build() -> UIViewController {
        let view = DetailedPokemonViewController()
        let presenter = DetailedPokemonPresenter()
        let interactor = DetailedPokemonInteractor()
        let router = DetailedPokemonRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
