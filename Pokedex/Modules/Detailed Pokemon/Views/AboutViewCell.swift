//
//  AboutViewCell.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

import UIKit

final class AboutViewCell: UICollectionViewCell {
    
    lazy var speciesWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Species"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var speciesLabel: UILabel = {
        let view = UILabel()
        view.text = "Seed"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var heightWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Height"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var heightLabel: UILabel = {
        let view = UILabel()
        view.text = "2'3,6\"(0.70 cm)"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var weightWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Weight"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var weightLabel: UILabel = {
        let view = UILabel()
        view.text = "15.2 lbs (6.9 kg)"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var abilitiesWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Abilities"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var abilitiesLabel: UILabel = {
        let view = UILabel()
        view.text = "Overgrow, Chlorophyl"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var breedingWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Breeding"
        view.font = Constants.shared.detailedPokemonCardHeaderLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var genderWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Gender"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var genderView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var maleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "male")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var femaleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "female")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var genderLabelMale: UILabel = {
        let view = UILabel()
        view.text = "-9"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var genderLabelFemale: UILabel = {
        let view = UILabel()
        view.text = "-9"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var eggGroupsWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Egg Groups"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var eggGroupsLabel: UILabel = {
        let view = UILabel()
        view.text = "Monster"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var eggCycleWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Egg Cycle"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var eggCycleLabel: UILabel = {
        let view = UILabel()
        view.text = "Grass"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(speciesWordLabel)
        speciesWordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(speciesLabel)
        speciesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(speciesWordLabel.snp.right).offset(40)
        }
        
        addSubview(heightWordLabel)
        heightWordLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(heightLabel)
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(15)
            make.left.equalTo(heightWordLabel.snp.right).offset(40)
        }
        
        addSubview(weightWordLabel)
        weightWordLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(15)
            make.left.equalTo(weightWordLabel.snp.right).offset(40)
        }
        
        addSubview(abilitiesWordLabel)
        abilitiesWordLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(abilitiesLabel)
        abilitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(15)
            make.left.equalTo(abilitiesWordLabel.snp.right).offset(40)
        }
        
        addSubview(breedingWordLabel)
        breedingWordLabel.snp.makeConstraints { make in
            make.top.equalTo(abilitiesLabel.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
        }
        
        addSubview(genderWordLabel)
        genderWordLabel.snp.makeConstraints { make in
            make.top.equalTo(breedingWordLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(genderView)
        genderView.snp.makeConstraints { make in
            make.top.equalTo(breedingWordLabel.snp.bottom).offset(25)
            make.left.equalTo(genderWordLabel.snp.right).offset(40)
        }
        
        genderView.addSubview(maleImageView)
        maleImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        genderView.addSubview(genderLabelMale)
        genderLabelMale.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(maleImageView.snp.right).offset(10)
        }
        
        genderView.addSubview(femaleImageView)
        femaleImageView.snp.makeConstraints { make in
            make.left.equalTo(genderLabelMale.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        genderView.addSubview(genderLabelFemale)
        genderLabelFemale.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(femaleImageView.snp.right).offset(5)
        }
        
        addSubview(eggGroupsWordLabel)
        eggGroupsWordLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabelMale.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(eggGroupsLabel)
        eggGroupsLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabelMale.snp.bottom).offset(15)
            make.left.equalTo(eggGroupsWordLabel.snp.right).offset(40)
        }
        
        addSubview(eggCycleWordLabel)
        eggCycleWordLabel.snp.makeConstraints { make in
            make.top.equalTo(eggGroupsLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo(88)
        }
        
        addSubview(eggCycleLabel)
        eggCycleLabel.snp.makeConstraints { make in
            make.top.equalTo(eggGroupsLabel.snp.bottom).offset(15)
            make.left.equalTo(eggCycleWordLabel.snp.right).offset(40)
        }
        
    }
}
