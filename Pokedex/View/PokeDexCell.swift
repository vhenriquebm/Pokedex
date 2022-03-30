//
//  PokeDexCell.swift
//  Pokedex
//
//  Created by Vitor Henrique Barreiro Marinho on 14/03/22.
//

import UIKit


class PokeDexCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    
    var pokemon: Pokemon? {
        
        didSet {
            
            nameLabel.text = pokemon?.name
            imageView.image = pokemon?.image
            
        }
    }
    
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        //iv.backgroundColor = .groupTableViewBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    lazy var nameContainerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .mainPink()
        
        view.addSubview(nameLabel)
        
        nameLabel.center(inView: view)
        
        
        return view
    }()
    
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Bulbasaur"
        return label
        
    }()
    
    // MARK: - Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
configureViewComponents()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        //MARK: - SELECTORS
    
    @objc func handleLongPress (sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            
            print("it is working")
        }
        
        else if sender.state == .ended {
            
            print("it ended")
        }
    }
    
    // MARK: - Helpers

    func configureViewComponents () {
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
        
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    
    
    
    
}
