//
//  InfoView.swift
//  Pokedex
//
//  Created by Vitor Henrique Barreiro Marinho on 30/03/22.
//

import UIKit


class InfoView: UIView {
    
    
    let imageView:UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .yellow
        return iv
        
    } ()
    
    lazy var nameContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .mainPink()
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        nameLabel.center(inView: view)
        return view
    }()
    
    
    let nameLabel: UILabel = {
       let label = UILabel ()
        label.text = "Charmander"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    let typeLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
    let defenseLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
    let heightLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
    let pokedexLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
    let attackLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
    let weightLabel: UILabel = {
       let label = UILabel ()
        label.text = "Fire Type"
        label.textColor = .mainPink()
        return label
    }()
    
  
    
  
    
    
    let infoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .mainPink()
        button.setTitle("More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    //MARK: - Init

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selectors
    
    @objc func handleViewMoreInfo () {
        print ( "handle view more info...")
        
    }
    
    
    func configureViewComponents() {
        
        backgroundColor = .white
        self.layer.masksToBounds = true
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(imageView)
        imageView.anchor(top: nameContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 60)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(typeLabel)
        typeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: imageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexLabel)
        pokedexLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 50)
        
    }
    
    
    
}
