//
//  MenuBarCell.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 18.06.23.
//

import UIKit

final class MenuBarCell: UICollectionViewCell {
    
    lazy var sectionNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Base Stats"
        view.font = Constants.shared.detailedPokemonCardStatLabelFont
        view.textColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            sectionNameLabel.textColor = isSelected ? .black : Constants.shared.detailedPokemonCardStatLabelColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionNameLabel)
        sectionNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
