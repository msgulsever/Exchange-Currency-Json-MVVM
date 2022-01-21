//
//  Webservice.swift
//  DovizConverterApp
//
//  Created by Muhammed Selimhan gülsever on 19.01.2022.
//

import Foundation


class Webservice {
    
    func downloadcurrencies (url : URL, completion : @escaping (CurrencyModel?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(nil)
                
            }else if let data = data {
                
                let dovizlist = try? JSONDecoder().decode(CurrencyModel.self, from: data)
                
                print(dovizlist)
                
                if let dovizlist = dovizlist {
                    
                    completion(dovizlist)
                }
               
            }
            
        }.resume()
        
    }
    
  
    
    
    
    
}
