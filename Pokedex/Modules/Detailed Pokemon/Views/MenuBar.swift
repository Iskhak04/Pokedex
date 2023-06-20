//
//  MenuBar.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 18.06.23.
//

import UIKit
import SnapKit

final class MenuBar: UIView {
    
    private let sectionNames: [String] = ["About", "Base Stats", "Evolution", "Moves"]
    var detailedPokemonVC: DetailedPokemonViewController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(MenuBarCell.self, forCellWithReuseIdentifier: "MenuBarCell")
        view.isScrollEnabled = false
        return view
    }()
    
    lazy var horizontalBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#787DA5")
        return view
    }()
    
    lazy var horizontalBGView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.shared.detailedPokemonCardStatLabelColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(horizontalBGView)
        horizontalBGView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-0.5)
            make.left.equalToSuperview().offset(0)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
        
        addSubview(horizontalBarView)
        horizontalBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.height.equalTo(2)
            make.width.equalToSuperview().dividedBy(4).offset(-20)
        }
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(horizontalBarView.snp.top).offset(0)
        }
        
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuBar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuBarCell", for: indexPath) as! MenuBarCell
        
        cell.sectionNameLabel.text = sectionNames[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.sectionNameLabel.snp.remakeConstraints { make in
                make.left.equalToSuperview()
            }
        case 3:
            cell.sectionNameLabel.snp.remakeConstraints { make in
                make.right.equalToSuperview()
            }
        default:
            ()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        switch indexPath.row {
        case 0:
            return CGSize(width: frame.width / 4 - 20, height: frame.height)
        case 1:
            return CGSize(width: frame.width / 4 + 20, height: frame.height)
        case 2:
            return CGSize(width: frame.width / 4 + 20, height: frame.height)
        case 3:
            return CGSize(width: frame.width / 4 - 20, height: frame.height)
        default:
            ()
        }
        
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let offset2 = self.frame.width / 4 - 20
        let offset3 = 2 * frame.width / 4
        let offset4 = 3 * frame.width / 4 + 20
        
        detailedPokemonVC?.detailedPokemonStatsCollectionVeiw.scrollToItem(at: indexPath, at: [], animated: true)
        
        self.horizontalBarView.snp.updateConstraints { make in
            make.left.equalToSuperview().offset(Int(frame.width) / 4 * indexPath.row)
            switch indexPath.row {
            case 0:
                make.width.equalToSuperview().dividedBy(4).offset(-20)
                make.left.equalToSuperview().offset(0)
            case 1:
                make.width.equalToSuperview().dividedBy(4).offset(20)
                make.left.equalToSuperview().offset(offset2)
            case 2:
                make.width.equalToSuperview().dividedBy(4).offset(20)
                make.left.equalToSuperview().offset(offset3)
            case 3:
                make.width.equalToSuperview().dividedBy(4).offset(-20)
                make.left.equalToSuperview().offset(offset4)
            default:
                ()
            }
        }
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)

    }
    
}
