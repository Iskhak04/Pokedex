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
    private var limit = 12
    private let maxOffset = 1271
    private var allFetchedPokemons: [PokemonViewModel] = []
    
    private lazy var pokemonsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(loadNewPokemons), for: .valueChanged)
        return view
    }()
    
    private lazy var spinnerView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView.startAnimating()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Pokedex"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        layout()
        presenter?.getPokemons(offset: offset, limit: limit)
        offset += limit
    }
    
    @objc private func loadNewPokemons() {
        presenter?.getPokemons(offset: offset, limit: limit)
        offset += limit
    }
    
    private func layout() {
        view.addSubview(pokemonsCollectionView)
        pokemonsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
        }
        
        view.addSubview(spinnerView)
        spinnerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension PokemonsViewController: PokemonsViewProtocol {
    
    func fetchedPokemons(allPokemons: [PokemonViewModel]) {
        allFetchedPokemons += allPokemons
        allFetchedPokemons.sort { pokemon1, pokemon2 in
            if pokemon2.id > pokemon1.id {
                return true
            }
            
            return false
        }
        loadNewPokemons()
        DispatchQueue.main.async {
            self.pokemonsCollectionView.reloadData()
            self.spinnerView.stopAnimating()
        }
        
    }
    
}

extension PokemonsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFetchedPokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonsCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        cell.layer.cornerRadius = 15
        cell.pokemonNameLabel.text = allFetchedPokemons[indexPath.row].name.capitalized
        cell.pokemonIdLabel.text = String(format: "#%04d", allFetchedPokemons[indexPath.row].id)
        cell.pokemonImageView.image = allFetchedPokemons[indexPath.row].image
        
        if allFetchedPokemons[indexPath.row].types.count == 1 {
            cell.pokemonSecondTypeButton.isHidden = true
            cell.pokemonFirstTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: allFetchedPokemons[indexPath.row].mainType).1
        } else {
            cell.pokemonSecondTypeButton.isHidden = false
            cell.pokemonFirstTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonSecondTypeButton.setTitle(allFetchedPokemons[indexPath.row].types[1].capitalized, for: .normal)
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: allFetchedPokemons[indexPath.row].mainType).1
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: allFetchedPokemons[indexPath.row].mainType).1
        }
        
        cell.backgroundColor = Constants.shared.defineBackgroundColor(type: allFetchedPokemons[indexPath.row].mainType).0
        cell.pokemonIdLabel.textColor = Constants.shared.defineBackgroundColor(type: allFetchedPokemons[indexPath.row].mainType).2
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == allFetchedPokemons.count - 1, offset < maxOffset {
            loadNewPokemons()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
