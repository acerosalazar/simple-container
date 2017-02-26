//
//  ServiceEntry.swift
//  SimpleContainer
//
//  Created by Acero Salazar Felix on 26/02/17.
//  Copyright © 2017 acerosalazar. All rights reserved.
//

import Foundation

protocol ServiceEntryProtocol: Any { }

class ServiceEntry<T>: ServiceEntryProtocol {
    
    let type: T.Type
    let factory: (ServiceResolver) -> T
    
    private var _instance: T?
    
    init(type: T.Type, factory: @escaping(ServiceResolver) -> T) {
        
        self.type = type
        self.factory = factory
    }
    
    func instance(_ resolver: ServiceResolver) -> T {
        
        if _instance == nil {
            
            _instance = factory(resolver)
        }
        
        return _instance!
    }
}
