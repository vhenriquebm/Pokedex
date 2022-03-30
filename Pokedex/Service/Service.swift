//
//  Service.swift
//  PokedexMVC
//
//  Created by Stephen Dowless on 1/9/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchPokemon(completion: @escaping ([Pokemon]) -> ()) {
        
    
        var pokemonArray = [Pokemon]()
        
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
                        if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
           
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject]
                 else { return }
                
               
              
                for (key, result) in resultArray.enumerated() {
                    
                    if let dictionary = result as? [String: AnyObject] {
                        let pokemon = Pokemon(id: key, dictionary: dictionary)
                        guard let imageUrl = pokemon.imageUrl else { return }
                        self.fetchImage(withUrlString: imageUrl, completion: { (image) in
                            pokemon.image = image
                        
                        
                        
                        pokemonArray.append(pokemon)

                            pokemonArray.sort(by: { (poke1, poke2) -> Bool in
                                return poke1.id! < poke2.id!
                            })
                            completion(pokemonArray)

                       /* guard let imageUrl = pokemon.imageURL else { return }
                        self.fetchImage(withUrlString: imageUrl, completion: { (image) in
                            pokemon.image = image
                            pokemonArray.append(pokemon)
                            completion(pokemonArray)
                        })*/
                    })
                    
                    completion(pokemonArray)

                }
                }
                
            } catch let error {
                print("Failed to create json with error: ", error.localizedDescription)
            }
            
        }.resume()
    }
    
    

    
    
   /* private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch image with error:  \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
            
        }.resume()
    }*/
    
    
    
   /* func recuperaDados () {
        
    
        if let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=7f90c16b1428bbd2961cbdfd637dba99&language=en-US&page=1") {
            let tarefa = URLSession.shared.dataTask(with: url) {(dados, requisicao, erro) in
            
            if erro == nil {
                
                if let dadosRetorno = dados {
                    
                    do {
                        if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                            
                          
                            
                            print (objetoJson)
                            
                            if let brl = objetoJson["BRL"] as? [String:Any] {
                                
                            
                                  
                                            
                                }
                            }

                        }
            catch  {
                    
                        print ("Erro ao formatar o retorno")
                    }
                      
                 
                }
                
                
        } else {
                    print ("Erro ao fazer a consulta do preço")
                }
                

    }

    
            tarefa.resume()

        
    }
    
    
    
    
}*/
    
    
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch image with error:  \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
            
        }.resume()
    }


}
