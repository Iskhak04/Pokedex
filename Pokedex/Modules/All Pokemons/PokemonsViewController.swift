//
//  PokemonsViewController.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit

final class PokemonsViewController: UIViewController {
    
    var presenter: PokemonsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        layout()
        presenter?.getPokemons()
    }
    
    private func layout() {
        
    }
}

extension PokemonsViewController: PokemonsViewProtocol {
    
}
