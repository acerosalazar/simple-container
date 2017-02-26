//
//  ServiceContainer.swift
//  SimpleContainer
//
//  Created by Acero Salazar Felix on 26/02/17.
//  Copyright © 2017 acerosalazar. All rights reserved.
//

import Foundation

public protocol ServiceResolver {
    
    func resolve<T>(_ type: T.Type) -> T?
}

public class ServiceContainer: ServiceResolver {
    
    private var services = [ServiceKey: ServiceEntryProtocol]()
    
    public func reset() {
        
        services = [ServiceKey: ServiceEntryProtocol]()
    }
    
    public func deregister<T>(_ type: T.Type) {
        
        let key = ServiceKey(type: type)
        services[key] = .none
    }
    
    public func register<T>(_ type: T.Type, factory: @escaping(ServiceResolver) -> T) {
        
        let key = ServiceKey(type: type)
        let entry = ServiceEntry<T>(type: type, factory: factory)
        services[key] = entry
    }
    
    // MARK: ServiceResolver
    
    public func resolve<T>(_ type: T.Type) -> T? {
        
        let key = ServiceKey(type: type)
        
        if let entry = services[key] as? ServiceEntry<T> {
            
            return entry.instance(self)
        }
        else {
            #if DEBUG
                print("Could not resolve service: \(key.name)")
            #endif
            return nil
        }
    }
}
