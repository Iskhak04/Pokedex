//
//  EvolutionViewCell.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

import UIKit

final class EvolutionViewCell: UICollectionViewCell {
    
    lazy var topView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        return view
    }()
    
    lazy var firstTypePokemonImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var secondTypePokemonImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var firstArrowImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large))
        view.tintColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var firstLevelLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        return view
    }()
    
    lazy var thirdTypePokemonImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fourthTypePokemonImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var secondArrowImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large))
        view.tintColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var secondLevelLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var firstPokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Bulbasaur"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var firstPokemonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var secondPokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Ivysaur"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var secondPokemonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var thirdPokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Ivysaur"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var thirdPokemonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var fourthPokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Venusaur"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var fourthPokemonView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(100)
        }
        
        topView.addSubview(firstPokemonView)
        firstPokemonView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        
        firstPokemonView.addSubview(firstTypePokemonImageView)
        firstTypePokemonImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        firstPokemonView.addSubview(firstPokemonNameLabel)
        firstPokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTypePokemonImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        topView.addSubview(firstArrowImageView)
        firstArrowImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        topView.addSubview(firstLevelLabel)
        firstLevelLabel.snp.makeConstraints { make in
            make.top.equalTo(firstArrowImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        topView.addSubview(secondPokemonView)
        secondPokemonView.snp.makeConstraints { make in
            make.right.bottom.top.equalToSuperview()
            make.width.equalTo(100)
        }
        
        secondPokemonView.addSubview(secondTypePokemonImageView)
        secondTypePokemonImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        secondPokemonView.addSubview(secondPokemonNameLabel)
        secondPokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTypePokemonImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(100)
        }
        
        bottomView.addSubview(thirdPokemonView)
        thirdPokemonView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        
        thirdPokemonView.addSubview(thirdTypePokemonImageView)
        thirdTypePokemonImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        thirdPokemonView.addSubview(thirdPokemonNameLabel)
        thirdPokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTypePokemonImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        bottomView.addSubview(secondArrowImageView)
        secondArrowImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bottomView.addSubview(secondLevelLabel)
        secondLevelLabel.snp.makeConstraints { make in
            make.top.equalTo(secondArrowImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        bottomView.addSubview(fourthPokemonView)
        fourthPokemonView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        
        fourthPokemonView.addSubview(fourthTypePokemonImageView)
        fourthTypePokemonImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        fourthPokemonView.addSubview(fourthPokemonNameLabel)
        fourthPokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthTypePokemonImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
}
