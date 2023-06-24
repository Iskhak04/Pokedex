//
//  BaseStatsViewCell.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 19.06.23.
//

import UIKit

final class BaseStatsViewCell: UICollectionViewCell {
    
    lazy var hpWordLabel: UILabel = {
        let view = UILabel()
        view.text = "HP"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var hpLabel: UILabel = {
        let view = UILabel()
        view.text = "45"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var hpView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var hpIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var hpIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var attackWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Attack"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var attackLabel: UILabel = {
        let view = UILabel()
        view.text = "60"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var attackView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var attackIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var attackIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var defenseWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Defense"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var defenseLabel: UILabel = {
        let view = UILabel()
        view.text = "48"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var defenseView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var defenseIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var defenseIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var spAtkWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Sp. Atk"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var spAtkLabel: UILabel = {
        let view = UILabel()
        view.text = "65"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var spAtkView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var spAtkIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var spAtkIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var spDefWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Sp. Def"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var spDefLabel: UILabel = {
        let view = UILabel()
        view.text = "65"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var spDefView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var spDefIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var spDefIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var speedWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Speed"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var speedLabel: UILabel = {
        let view = UILabel()
        view.text = "45"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var speedView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var speedIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var speedIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var totalWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Total"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    lazy var totalLabel: UILabel = {
        let view = UILabel()
        view.text = "317"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var totalView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var totalIndicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var totalIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var typeDefensesWordLabel: UILabel = {
        let view = UILabel()
        view.text = "Type defenses"
        view.font = Constants.shared.detailedPokemonCardHeaderLabelFont
        view.textColor = .black
        return view
    }()
    
    lazy var typeDefensesLabel: UILabel = {
        let view = UILabel()
        view.text = "The effectiveness of each type on Charmander."
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(hpView)
        hpView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        hpView.addSubview(hpWordLabel)
        hpWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        hpView.addSubview(hpLabel)
        hpLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(hpWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        hpView.addSubview(hpIndicatorBackgroundView)
        hpIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(hpLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        hpView.addSubview(hpIndicatorView)
        hpIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(hpLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(attackView)
        attackView.snp.makeConstraints { make in
            make.top.equalTo(hpView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        attackView.addSubview(attackWordLabel)
        attackWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        attackView.addSubview(attackLabel)
        attackLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(attackWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        attackView.addSubview(attackIndicatorBackgroundView)
        attackIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(attackLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        attackView.addSubview(attackIndicatorView)
        attackIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(attackLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(defenseView)
        defenseView.snp.makeConstraints { make in
            make.top.equalTo(attackView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        defenseView.addSubview(defenseWordLabel)
        defenseWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        defenseView.addSubview(defenseLabel)
        defenseLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(defenseWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        defenseView.addSubview(defenseIndicatorBackgroundView)
        defenseIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(defenseLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        defenseView.addSubview(defenseIndicatorView)
        defenseIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(defenseLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(spAtkView)
        spAtkView.snp.makeConstraints { make in
            make.top.equalTo(defenseView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        spAtkView.addSubview(spAtkWordLabel)
        spAtkWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        spAtkView.addSubview(spAtkLabel)
        spAtkLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spAtkWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        spAtkView.addSubview(spAtkIndicatorBackgroundView)
        spAtkIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spAtkLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        spAtkView.addSubview(spAtkIndicatorView)
        spAtkIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spAtkLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(spDefView)
        spDefView.snp.makeConstraints { make in
            make.top.equalTo(spAtkView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        spDefView.addSubview(spDefWordLabel)
        spDefWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        spDefView.addSubview(spDefLabel)
        spDefLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spDefWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        spDefView.addSubview(spDefIndicatorBackgroundView)
        spDefIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spDefLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        spDefView.addSubview(spDefIndicatorView)
        spDefIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(spDefLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(speedView)
        speedView.snp.makeConstraints { make in
            make.top.equalTo(spDefView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        speedView.addSubview(speedWordLabel)
        speedWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        speedView.addSubview(speedLabel)
        speedLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(speedWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        speedView.addSubview(speedIndicatorBackgroundView)
        speedIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(speedLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        speedView.addSubview(speedIndicatorView)
        speedIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(speedLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(10)
        }
        
        addSubview(totalView)
        totalView.snp.makeConstraints { make in
            make.top.equalTo(speedView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(18)
        }
        
        totalView.addSubview(totalWordLabel)
        totalWordLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(64)
        }
        
        totalView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(totalWordLabel.snp.right).offset(40)
            make.width.equalTo(29)
        }
        
        totalView.addSubview(totalIndicatorBackgroundView)
        totalIndicatorBackgroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(totalLabel.snp.right).offset(21)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        totalView.addSubview(totalIndicatorView)
        totalIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(totalLabel.snp.right).offset(21)
            make.height.equalTo(4)
            make.width.equalTo(0)
        }
        
        addSubview(typeDefensesWordLabel)
        typeDefensesWordLabel.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
        }
        
        addSubview(typeDefensesLabel)
        typeDefensesLabel.snp.makeConstraints { make in
            make.top.equalTo(typeDefensesWordLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
