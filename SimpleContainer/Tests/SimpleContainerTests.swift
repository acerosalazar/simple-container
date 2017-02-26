//
//  SimpleContainerTests.swift
//  SimpleContainerTests
//
//  Created by Acero Salazar Felix on 26/02/17.
//  Copyright © 2017 acerosalazar. All rights reserved.
//

import XCTest
@testable import SimpleContainer

class SimpleContainerTests: XCTestCase {
    
    struct Person {
        let name: String
    }
    
    struct Vehicle {
        let name: String
        let driver: Person
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let container = ServiceContainer()
        let driverName = "Tomaš Novak"
        let vehicleName = "Škoda"
        
        container.register(Vehicle.self) { r in
            return Vehicle(name: vehicleName, driver: r.resolve(Person.self)!)
        }
        
        container.register(Person.self) { _ in
            return Person(name: driverName )
        }
        
        let vehicle = container.resolve(Vehicle.self)!
        
        XCTAssert(vehicle.name == vehicleName)
        XCTAssert(vehicle.driver.name == driverName)
    }
}
