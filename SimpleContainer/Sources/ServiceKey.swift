//
//  ServiceKey.swift
//  SimpleContainer
//
//  Created by Acero Salazar Felix on 26/02/17.
//  Copyright © 2017 acerosalazar. All rights reserved.
//

import Foundation

class ServiceKey: Hashable {
    
    let name: String
    
    init<T>(type: T.Type) {
        
        self.name = String(describing: type)
    }
    
    var hashValue: Int {
        
        return self.name.hashValue
    }
}


func==(lh: ServiceKey, rh: ServiceKey) -> Bool {
    
    return lh.name == rh.name
}
