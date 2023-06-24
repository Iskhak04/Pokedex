//
//  PokemonsViewController.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 15.06.23.
//

import UIKit
import SnapKit
import Hex
import SwiftSVG

final class PokemonsViewController: UIViewController {
    
    var presenter: PokemonsPresenterProtocol?
    private var offset = 0
    private var limit = 12
    private let maxOffset = 1269
    private var allFetchedPokemons: [PokemonViewModel] = []
    private var filteredPokemons: [PokemonViewModel] = []
    var imageWidth: Double = 80
    var imageHeight: Double = 80
    
    private lazy var pokemonsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        return view
    }()
    
    private lazy var testImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
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
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.delegate = self
        return view
    }()
    
    private lazy var scrollToTopButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.up.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)), for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 30
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(scrollToTopButtonClicked), for: .touchUpInside)
        view.isHidden = true
        return view
    }()
    
    private lazy var scrollToBottomButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.down.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)), for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 30
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(scrollToBottomButtonClicked), for: .touchUpInside)
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView.startAnimating()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Pokedex"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        navigationItem.titleView = searchBar
        
        layout()
        presenter?.getPokemons(offset: offset, limit: limit, imageWidth: imageWidth, imageHeight: imageHeight)
        offset += limit
    }
    
    @objc private func scrollToBottomButtonClicked() {
        let arrayCount = filteredPokemons.count
        pokemonsCollectionView.scrollToItem(at: IndexPath(row: arrayCount - 1, section: 0), at: [], animated: true)
    }
    
    @objc private func scrollToTopButtonClicked() {
        pokemonsCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: [], animated: true)
    }
    
    @objc private func loadNewPokemons() {
        presenter?.getPokemons(offset: offset, limit: limit, imageWidth: imageWidth, imageHeight: imageHeight)
        offset += limit
        refreshControl.endRefreshing()
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
        
        view.addSubview(scrollToBottomButton)
        scrollToBottomButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        view.addSubview(scrollToTopButton)
        scrollToTopButton.snp.makeConstraints { make in
            make.bottom.equalTo(scrollToBottomButton.snp.top).offset(-10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
    }
}

extension PokemonsViewController: PokemonsViewProtocol {
    func sendSVG(imageView: UIImageView) {
        testImageView = imageView
    }
    
    func fetchedPokemons(allPokemons: [PokemonViewModel]) {
        allFetchedPokemons += allPokemons
        filteredPokemons += allPokemons
        allFetchedPokemons.sort { pokemon1, pokemon2 in
            if pokemon2.id > pokemon1.id {
                return true
            }

            return false
        }
        loadNewPokemons()
        DispatchQueue.main.async {
            self.spinnerView.stopAnimating()
            self.pokemonsCollectionView.reloadData()
            self.scrollToTopButton.isHidden = false
            self.scrollToBottomButton.isHidden = false
        }
        
    }
    
}

extension PokemonsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPokemons = searchText.isEmpty ? allFetchedPokemons : allFetchedPokemons.filter({ poke in
            return poke.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        
        pokemonsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonsCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        
        
        let hideView = UIView()
        cell.addSubview(hideView)
        hideView.layer.cornerRadius = 15
        hideView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(150)
            make.width.equalTo(185)
        }
        hideView.backgroundColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).0
        
        view.backgroundColor = .systemBackground
        
        cell.layer.cornerRadius = 15
        cell.pokemonNameLabel.text = filteredPokemons[indexPath.row].name.capitalized
        cell.pokemonIdLabel.text = String(format: "#%04d", filteredPokemons[indexPath.row].id)
        
        cell.pokemonImageView = filteredPokemons[indexPath.row].imageView
        
        
        
        if filteredPokemons[indexPath.row].types.count == 1 {
            cell.pokemonSecondTypeButton.isHidden = true
            cell.pokemonFirstTypeButton.setTitle(filteredPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).1
        } else {
            cell.pokemonSecondTypeButton.isHidden = false
            cell.pokemonFirstTypeButton.setTitle(filteredPokemons[indexPath.row].types[0].capitalized, for: .normal)
            cell.pokemonSecondTypeButton.setTitle(filteredPokemons[indexPath.row].types[1].capitalized, for: .normal)
            cell.pokemonFirstTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).1
            cell.pokemonSecondTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).1
        }
        
        cell.backgroundColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).0
        cell.pokemonIdLabel.textColor = Constants.shared.defineBackgroundColor(type: filteredPokemons[indexPath.row].mainType).2
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("willDisplay")
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.goToDetailedPage(pokemonUrlString: filteredPokemons[indexPath.row].url, mainType: filteredPokemons[indexPath.row].mainType)
    }
    
}
