//
//  Pokemon.swift
//  Pokedex
//
//  Created by Vitor Henrique Barreiro Marinho on 16/03/22.
//

import UIKit



class Pokemon {
    
    
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weigth: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseExperience: Int?
    
    
    init(id:Int, dictionary: [String: AnyObject]) {
        
        
        self.id = id
        
        if let name = dictionary ["name"] as? String {
            
            self.name = name
        }
        
        
        
        if let imageUrl = dictionary ["imageUrl"] as? String {
            
            self.imageUrl = imageUrl
        }
        
        
        if let image = dictionary ["image"] as? UIImage {
            
            self.image = image
        }
        
        
       
        
        if let weigth = dictionary ["weigth"] as? Int {
            
            self.weigth = weigth
        }
        
        
        if let height = dictionary ["height"] as? Int {
            
            self.height = height
        }
        
        
        if let defense = dictionary ["defense"] as? Int {
            
            self.defense = defense
        }
        
        
        if let attack = dictionary ["attack"] as? Int {
            
            self.attack = attack
        }
        
        
        if let description = dictionary ["description"] as? String {
            
            self.description = description
        }
        
        
        if let type = dictionary ["type"] as? String {
            
            self.type = type
        }
        
        
        if let baseExperience = dictionary ["baseExperience"] as? Int {
            
            self.baseExperience = baseExperience
        }
        
        
        
        
    }
    
}



