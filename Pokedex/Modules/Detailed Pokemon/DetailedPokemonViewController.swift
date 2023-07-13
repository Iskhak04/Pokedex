//
//  DetailedPokemonViewController.swift
//  Pokedex
//
//  Created by Iskhak Zhutanov on 17.06.23.
//

import UIKit

final class DetailedPokemonViewController: UIViewController {
    
    var presenter: DetailedPokemonPresenterProtocol?
    var pokemonUrlString: String = ""
    var pokemon: PokemonModel?
    var imageWidth: Double = 230
    var imageHeight: Double = 230
    var statIndicatorViewWidth: Double = 232
    var pokemonSpecies: PokemonSpeciesModel?
    var pokemonMainType: PokemonTypes = .bug
    var isFirstTimeOpened: Bool = false
    var pokemonEvolution: EvolutionViewModel?
    var pokemonMoves: [MoveModel] = []
    
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
        view.isHidden = true
        return view
    }()
    
    private lazy var detailedPokemonImageView: UIImageView = {
        let view = UIImageView()
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
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var menuBar: MenuBar = {
        let view = MenuBar()
        view.detailedPokemonVC = self
        return view
    }()
    
    private lazy var spinnerView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstTimeOpened = true
        view.backgroundColor = .white
        view.addSubview(spinnerView)
        spinnerView.startAnimating()
        spinnerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        presenter?.getPokemon(pokemonUrlString: pokemonUrlString, imageWidth: imageWidth, imageHeight: imageHeight)
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func configureColors() {
        view.backgroundColor = Constants.shared.defineBackgroundColor(type: pokemonMainType).0
        detailedPokemonFirstTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: pokemonMainType).1
        detailedPokemonSecondTypeButton.backgroundColor = Constants.shared.defineBackgroundColor(type: pokemonMainType).1
        detailedPokemonIdLabel.textColor = Constants.shared.defineBackgroundColor(type: pokemonMainType).2
    }
    
    @objc private func leftBarButtonItemClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupImageView() {
        view.addSubview(detailedPokemonImageView)
        detailedPokemonImageView.snp.makeConstraints { make in
            make.top.equalTo(detailedPokemonFirstTypeButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(5)
            make.height.equalTo(imageHeight)
            make.width.equalTo(imageWidth)
        }
    }
    
    private func defineQualityOfStat(indicatorWidth: Double) -> UIColor {
        
        let badQuality = UIColor.systemRed
        let mediumQuality = UIColor.systemOrange
        let goodQuality = UIColor.systemCyan
        let bestQuality = UIColor.systemGreen
        
        if indicatorWidth >= 0 && indicatorWidth <= 58 {
            return badQuality
        } else if indicatorWidth > 58 && indicatorWidth <= 116 {
            return mediumQuality
        }
        else if indicatorWidth > 116 && indicatorWidth <= 174 {
            return goodQuality
        }
        
        return bestQuality
    }
    
    private func definePokemonGender(genderRate: Int) -> (Double, Double) {
        var chanceMale: Double = 0
        var chanceFemale: Double = 0
        
        if genderRate == -1 {
            return (0,0)
        }
        
        chanceFemale = Double(genderRate) * 100 / 8
        chanceMale = 100 - chanceFemale
        
        return (chanceMale, chanceFemale)
    }
    
    private func calculateStats(statValue: Int, statMaxValue: Int) -> Double {
        let percent: Double = Double(statValue * 100 / statMaxValue)
        
        let width: Double = percent * statIndicatorViewWidth / 100
        
        return width
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
        
        var returnCell = UICollectionViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "AboutViewCell", for: indexPath) as! AboutViewCell
            
            var abilities: String = ""
            var species: String = ""
            let height: Double = Double((pokemon?.height)!) / 10
            let weight: Double = Double((pokemon?.weight)!) / 10

            cell.speciesLabel.text = pokemon?.species.name.capitalized
            cell.heightLabel.text = "\(height) m"
            cell.weightLabel.text = "\(weight) kg"
            
            let genders = definePokemonGender(genderRate: pokemonSpecies!.genderRate)
            
            
            cell.genderLabelMale.text = "\(genders.0)%"
            cell.genderLabelFemale.text = "\(genders.1)%"
            
            
            
            
            if let speciesCount = pokemonSpecies?.eggGroups.count {
                for i in 0..<speciesCount {
                    
                    species += (pokemonSpecies?.eggGroups[i].name.capitalized)!
                    if i != speciesCount - 1 {
                        species += ", "
                    }
                }
            }
            

            if let abilitiesCount = pokemon?.abilities.count {
                for i in 0..<abilitiesCount {

                    abilities += (pokemon?.abilities[i].ability.name.capitalized)!
                    if i != (pokemon?.abilities.count)! - 1 {
                        abilities += ", "
                    }

                }
            }
            
            cell.eggGroupsLabel.text = species
            cell.abilitiesLabel.text = abilities
            returnCell = cell
        case 1:
            let cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "BaseStatsViewCell", for: indexPath) as! BaseStatsViewCell
            
            let hp = pokemon?.stats[0].baseStat ?? -1
            let attack = pokemon?.stats[1].baseStat ?? -1
            let defense = pokemon?.stats[2].baseStat ?? -1
            let spAtk = pokemon?.stats[3].baseStat ?? -1
            let spDef = pokemon?.stats[4].baseStat ?? -1
            let speed = pokemon?.stats[5].baseStat ?? -1
            let total = hp + attack + defense + spAtk + spDef + speed
            cell.hpLabel.text = "\(hp)"
            cell.attackLabel.text = "\(attack)"
            cell.defenseLabel.text = "\(defense)"
            cell.spAtkLabel.text = "\(spAtk)"
            cell.spDefLabel.text = "\(spDef)"
            cell.speedLabel.text = "\(speed)"
            cell.totalLabel.text = "\(total)"
            
            cell.hpIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: hp, statMaxValue: PokemonStats.shared.maxHp))

            cell.attackIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: attack, statMaxValue: PokemonStats.shared.maxAttack))

            cell.defenseIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: defense, statMaxValue: PokemonStats.shared.maxDefense))

            cell.spAtkIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: spAtk, statMaxValue: PokemonStats.shared.maxSpAtk))
            
            cell.spDefIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: spDef, statMaxValue: PokemonStats.shared.maxSpDef))

            cell.speedIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: speed, statMaxValue: PokemonStats.shared.maxSpeed))
            
            cell.totalIndicatorView.backgroundColor = defineQualityOfStat(indicatorWidth: self.calculateStats(statValue: total, statMaxValue: PokemonStats.shared.maxTotal))
            
            if isFirstTimeOpened {
                UIView.animate(withDuration: 2, delay: 0.2, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseIn, animations: {

                    cell.totalIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: total, statMaxValue: PokemonStats.shared.maxTotal), height: 0)
                    cell.hpIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: hp, statMaxValue: PokemonStats.shared.maxHp), height: 0)
                    cell.attackIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: attack, statMaxValue: PokemonStats.shared.maxAttack), height: 0)
                    cell.defenseIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: defense, statMaxValue: PokemonStats.shared.maxDefense), height: 0)
                    cell.spAtkIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: spAtk, statMaxValue: PokemonStats.shared.maxSpAtk), height: 0)
                    cell.spDefIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: spDef, statMaxValue: PokemonStats.shared.maxSpDef), height: 0)
                    cell.speedIndicatorView.frame = CGRect(x: 0, y: 0, width: self.calculateStats(statValue: speed, statMaxValue: PokemonStats.shared.maxSpeed), height: 0)
                    
                }, completion: nil)
                isFirstTimeOpened = false
            }
            
            cell.totalIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: total, statMaxValue: PokemonStats.shared.maxTotal))
            }
            
            cell.hpIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: hp, statMaxValue: PokemonStats.shared.maxHp))
            }
            
            cell.attackIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: attack, statMaxValue: PokemonStats.shared.maxAttack))
            }
            
            cell.defenseIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: defense, statMaxValue: PokemonStats.shared.maxDefense))
            }
            
            cell.spAtkIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: spAtk, statMaxValue: PokemonStats.shared.maxSpAtk))
            }
            
            cell.spDefIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: spDef, statMaxValue: PokemonStats.shared.maxSpDef))
            }
            
            cell.speedIndicatorView.snp.updateConstraints { make in
                make.width.equalTo(self.calculateStats(statValue: speed, statMaxValue: PokemonStats.shared.maxSpeed))
                
            }
        
            returnCell = cell
        case 2:
            let cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "EvolutionViewCell", for: indexPath) as! EvolutionViewCell
            cell.firstTypePokemonImageView = pokemonEvolution!.firstPokemonTypeImageView
            cell.secondTypePokemonImageView = pokemonEvolution!.secondPokemonTypeImageView
            
            cell.firstPokemonNameLabel.text = "\(pokemonEvolution?.pokemonNames[0].capitalized ?? "")"
            cell.secondPokemonNameLabel.text = "\(pokemonEvolution?.pokemonNames[1].capitalized ?? "")"
            
            if pokemonEvolution?.fourthPokemonTypeImageView == nil {
                cell.bottomView.isHidden = true
            } else {
                cell.thirdPokemonNameLabel.text = "\(pokemonEvolution?.pokemonNames[1].capitalized ?? "")"
                cell.fourthPokemonNameLabel.text = "\(pokemonEvolution?.pokemonNames[2].capitalized ?? "")"
                cell.thirdTypePokemonImageView = pokemonEvolution!.thirdPokemonTypeImageView
                cell.fourthTypePokemonImageView = pokemonEvolution!.fourthPokemonTypeImageView!
                cell.secondLevelLabel.text = ("Lvl \(pokemonEvolution?.secondLevel ?? 1)")
            }
            cell.firstLevelLabel.text = ("Lvl \(pokemonEvolution?.firstLevel ?? 1)")
            
            returnCell = cell
        case 3:
            let cell = detailedPokemonStatsCollectionVeiw.dequeueReusableCell(withReuseIdentifier: "MovesViewCell", for: indexPath) as! MovesViewCell
            cell.backgroundColor = .purple
            print(pokemonMoves[0].name)
            returnCell = cell
        default:
            ()
        }

        return returnCell
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
    
    func fetchedPokemon(pokemon: PokemonModel, svgImageView: UIImageView, pokemonSpecies: PokemonSpeciesModel, evolutionChain: EvolutionViewModel, moves: [MoveModel]) {
        
        self.pokemonSpecies = pokemonSpecies
        self.pokemonEvolution = evolutionChain
        self.pokemon = pokemon
        self.pokemonMoves = moves
        print(pokemon.name)
        DispatchQueue.main.async {
            self.detailedPokemonStatsCollectionVeiw.reloadData()
            self.detailedPokemonImageView = svgImageView
            self.detailedPokemonNameLabel.text = pokemon.name.capitalized
            self.detailedPokemonIdLabel.text = String(format: "#%04d", pokemon.id)
            
            if pokemon.types.count == 1 {
                self.detailedPokemonFirstTypeButton.setTitle(pokemon.types[0].type.name.capitalized, for: .normal)
            } else {
                self.detailedPokemonSecondTypeButton.isHidden = false
                self.detailedPokemonFirstTypeButton.setTitle(pokemon.types[0].type.name.capitalized, for: .normal)
                self.detailedPokemonSecondTypeButton.setTitle(pokemon.types[1].type.name.capitalized, for: .normal)
            }
            self.spinnerView.stopAnimating()
            self.configureColors()
            self.layout()
            self.setupImageView()
        }
    }
    
}

