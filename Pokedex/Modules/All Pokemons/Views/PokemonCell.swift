//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 16.06.23.
//

import UIKit

final class PokemonCell: UICollectionViewCell {
    
    lazy var pokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Bulbasaur"
        view.textColor = .white
        view.font = Constants.shared.pokemonCardNameLabelFont
        return view
    }()
    
    lazy var pokemonIdLabel: UILabel = {
        let view = UILabel()
        view.text = "#001"
        view.textColor = Constants.shared.pokemonCardGrassIdColor
        view.font = Constants.shared.pokemonCardIdLabelFont
        return view
    }()
    
    lazy var pokemonFirstTypeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Electric", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = Constants.shared.pokemonCardTypeButtonFont
        view.backgroundColor = Constants.shared.pokemonTypeGrassColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var pokemonSecondTypeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Poison", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = Constants.shared.pokemonCardTypeButtonFont
        view.backgroundColor = Constants.shared.pokemonTypeGrassColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var pokemonImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(pokemonNameLabel)
        pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview().offset(15)
        }
        
        addSubview(pokemonIdLabel)
        pokemonIdLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-10)
        }
        
        addSubview(pokemonFirstTypeButton)
        pokemonFirstTypeButton.snp.makeConstraints { make in
            make.top.equalTo(pokemonNameLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        addSubview(pokemonSecondTypeButton)
        pokemonSecondTypeButton.snp.makeConstraints { make in
            make.top.equalTo(pokemonFirstTypeButton.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        addSubview(pokemonImageView)
        pokemonImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
}
