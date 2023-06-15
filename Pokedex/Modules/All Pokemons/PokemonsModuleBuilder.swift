//
//  PokemonsModuleBuilder.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit

final class PokemonsModuleBuilder {
    func build() -> UIViewController {
        let view = PokemonsViewController()
        let presenter = PokemonsPresenter()
        let interactor = PokemonsInteractor()
        let router = PokemonsRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
