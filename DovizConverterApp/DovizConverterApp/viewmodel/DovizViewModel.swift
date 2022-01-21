//
//  DovizViewModel.swift
//  DovizConverterApp
//
//  Created by Muhammed Selimhan gülsever on 21.01.2022.
//

import Foundation


struct DovizListViewModel {
    
    let dovizlistetutucu : CurrencyModel
    
    var name : String {
        return self.dovizlistetutucu.base
    }
    var rates: Dictionary<String, Double> {
        
        return self.dovizlistetutucu.rates
    }
    

}

/* struct dovizlistViewModelCogul {
    
    let doviztutucular : [CurrencyModel]
    
    
    func NumberOfRowsInComponent() -> Int {
        return self.doviztutucular.count
        
    }
    func dovizAtIndex ( index: Int) -> DovizListViewModel {
        let doviz = self.doviztutucular[index]
        return DovizListViewModel(dovizlistetutucu: doviz)
    }
    
}
*/
