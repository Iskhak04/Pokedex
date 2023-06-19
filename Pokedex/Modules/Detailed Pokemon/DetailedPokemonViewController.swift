//
//  DetailedPokemonViewController.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import UIKit

final class DetailedPokemonViewController: UIViewController {
    
    var presenter: DetailedPokemonPresenterProtocol?

    
    private lazy var detailedPokemonNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Bulbasaur"
        view.font = Constants.shared.detailedPokemonCardNameLabelFont
        view.textColor = .white
        return view
    }()
    
    private lazy var detailedPokemonIdLabel: UILabel = {
        let view = UILabel()
        view.text = "#0001"
        view.textColor = .white
        view.font = Constants.shared.detailedPokemonCardIdLabelFont
        return view
    }()
    
    private lazy var detailedPokemonFirstTypeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Electric", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = Constants.shared.detailedPokemonCardTypeButtonFont
        view.backgroundColor = Constants.shared.pokemonTypeGrassColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var detailedPokemonSecondTypeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Poison", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = Constants.shared.detailedPokemonCardTypeButtonFont
        view.backgroundColor = Constants.shared.pokemonTypeGrassColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var detailedPokemonImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)), style: .done, target: self, action: #selector(leftBarButtonItemClicked))
        view.tintColor = .white
        return view
    }()
    
    private lazy var detailedPokemonStatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        return view
    }()
    
    lazy var detailedPokemonStatsCollectionVeiw: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.register(AboutViewCell.self, forCellWithReuseIdentifier: "AboutViewCell")
        view.register(BaseStatsViewCell.self, forCellWithReuseIdentifier: "BaseStatsViewCell")
        view.register(EvolutionViewCell.self, forCellWithReuseIdentifier: "EvolutionViewCell")
        view.register(MovesViewCell.self, forCellWithReuseIdentifier: "MovesViewCell")
        layout.scrollDirection = .horizontal
        view.isPagingEnabled = true
        return view
    }()
    
    lazy var menuBar: MenuBar = {
        let view = MenuBar()
        view.detailedPokemonVC = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.shared.pokemonCardGrassColor
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = leftBarButtonItem
        layout()
    }
    
    @objc private func leftBarButtonItemClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    private func layout() {
        view.addSubview(detailedPokemonNameLabel)
        detailedPokemonNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
        }
        
        view.addSubview(detailedPokemonFirstTypeButton)
        detailedPokemonFirstTypeButton.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonNameLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.height.equalTo(32)
            make.width.equalTo(100)
        }
        
        view.addSubview(detailedPokemonSecondTypeButton)
        detailedPokemonSecondTypeButton.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonNameLabel.snp.bottom).offset(15)
            make.left.equalTo(detailedPokemonFirstTypeButton.snp.right).offset(10)
            make.height.equalTo(32)
            make.width.equalTo(100)
        }
        
        view.addSubview(detailedPokemonIdLabel)
        detailedPokemonIdLabel.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonNameLabel.snp.bottom).offset(-15)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
        }
        
        view.addSubview(detailedPokemonStatsView)
        detailedPokemonStatsView.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonFirstTypeButton.snp.bottom).offset(220)
            make.left.right.bottom.equalToSuperview()
        }
        
        detailedPokemonStatsView.addSubview(menuBar)
        menuBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(Constants.shared.sideOffset)
            make.right.equalToSuperview().offset(-Constants.shared.sideOffset)
            make.height.equalTo(46)
        }
        
        view.addSubview(detailedPokemonImageView)
        detailedPokemonImageView.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonFirstTypeButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(230)
            make.width.equalTo(230)
        }
        
        view.addSubview(detailedPokemonStatsCollectionVeiw)
        detailedPokemonStatsCollectionVeiw.snp.makeConstraints { make in
            make.top.equalTo(menuBar.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
    }
}

extension DetailedPokemonViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        switch indexPath.row {
        case 0:
            cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "AboutViewCell", for: indexPath) as! AboutViewCell
        case 1:
            cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "BaseStatsViewCell", for: indexPath) as! BaseStatsViewCell
            cell.backgroundColor = .green
        case 2:
            cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "EvolutionViewCell", for: indexPath) as! EvolutionViewCell
            cell.backgroundColor = .cyan
        case 3:
            cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "MovesViewCell", for: indexPath) as! MovesViewCell
            cell.backgroundColor = .purple
        default:
            ()
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: detailedPokemonStatsCollectionVeiw.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        let offset2 = menuBar.frame.width / 4 - 20
        let offset3 = 2 * menuBar.frame.width / 4
        let offset4 = 3 * menuBar.frame.width / 4 + 20

        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
        
        menuBar.horizontalBarView.snp.updateConstraints { make in
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
            self.menuBar.layoutIfNeeded()
        }, completion: nil)
        
    }
    
}

extension DetailedPokemonViewController: DetailedPokemonViewProtocol {
    
}

