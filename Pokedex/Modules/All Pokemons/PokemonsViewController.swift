//
//  PokemonsViewController.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit
import SnapKit
import Hex

final class PokemonsViewController: UIViewController {
    
    var presenter: PokemonsPresenterProtocol?
    private var offset = 0
    private var limit = 30
    private var allFetchedPokemons: [PokemonViewModel] = []
    
    private lazy var pokemonsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Pokedex"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        layout()
        presenter?.getPokemons(offset: offset, limit: limit)
    }
    
    private func layout() {
        view.addSubview(pokemonsCollectionView)
        pokemonsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
        }
    }
}

extension PokemonsViewController: PokemonsViewProtocol {
    
    func fetchedPokemons(allPokemons: [PokemonViewModel]) {
        allFetchedPokemons = allPokemons
        
        DispatchQueue.main.async {
            self.pokemonsCollectionView.reloadData()
        }
        
    }
    
}

extension PokemonsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFetchedPokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonsCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.backgroundColor = Constants.shared.pokemonCardGrassColor
        cell.layer.cornerRadius = 15
        cell.pokemonNameLabel.text = allFetchedPokemons[indexPath.row].name.capitalized
        cell.pokemonIdLabel.text = String(format: "%04d", allFetchedPokemons[indexPath.row].id)
        cell.pokemonImageView.image = allFetchedPokemons[indexPath.row].image
        
        switch allFetchedPokemons[indexPath.row].mainType {
        case .electric:
            cell.backgroundColor = Constants.shared.pokemonCardElectricColor
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.pokemonTypeElectricColor
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.pokemonTypeElectricColor
            cell.pokemonIdLabel.textColor = Constants.shared.pokemonCardElectricIdColor
        case .grass:
            cell.backgroundColor = Constants.shared.pokemonCardGrassColor
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.pokemonTypeGrassColor
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.pokemonTypeGrassColor
            cell.pokemonIdLabel.textColor = Constants.shared.pokemonCardGrassIdColor
        case .water:
            cell.backgroundColor = Constants.shared.pokemonCardWaterColor
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.pokemonTypeWaterColor
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.pokemonTypeWaterColor
            cell.pokemonIdLabel.textColor = Constants.shared.pokemonCardWaterIdColor
        case .fire:
            cell.backgroundColor = Constants.shared.pokemonCardFireColor
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.pokemonTypeFireColor
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.pokemonTypeFireColor
            cell.pokemonIdLabel.textColor = Constants.shared.pokemonCardFireIdColor
        }
        
        if allFetchedPokemons[indexPath.row].types.count == 1 {
            cell.pokemonFirstTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonSecondTypeButton.isHidden = true
        } else {
            cell.pokemonFirstTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonSecondTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[1].capitalized, for: .normal)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
