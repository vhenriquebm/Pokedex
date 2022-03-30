//
//  PokedexController.swift
//  Pokedex
//
//  Created by Vitor Henrique Barreiro Marinho on 14/03/22.
//

import UIKit


private let reuseIdentifier = "PokeDexCell"

class PokedexController: UICollectionViewController {
    
    //MARK: - Properties
    
    var pokemon = [Pokemon]()
    
    let infoView:InfoView = {
        let view = InfoView()
        view.layer.cornerRadius = 5
        return view
    }()
    

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchPokemon()
    }
    

    //MARK: - selectors
    
    @objc func showSearchBar () {
        
        print("is working")
    }
    
    
    //MARK: - API
    
    func fetchPokemon () {
        
        Service.shared.fetchPokemon { (pokemon) in
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.collectionView.reloadData()
            }
          
        }
        
    }
    
    //MARK: - Helper
    
    
    func configureView () {
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .mainPink()
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Pokedex"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.register(PokeDexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(infoView)
        infoView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 64, height: 500)
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -44).isActive = true
        
        
    }
    
    
    
}


extension PokedexController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    
               pokemon.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokeDexCell
        
        cell.pokemon = pokemon[indexPath.item]
        
        return cell
    }
    
    
}


extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 3
        return CGSize(width:width, height: width)
        
    }
    
}


