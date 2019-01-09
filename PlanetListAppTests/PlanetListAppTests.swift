//
//  PlanetListAppTests.swift
//  PlanetListAppTests
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import XCTest
@testable import PlanetListApp

class PlanetListAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPlanetViewModel() {
       let result = Result(name: "Alderaan", rotation_period: "24", orbital_period: "50")
        let planet = PlanetModel(count: 61, next: "url", previous: "URL", results: [result])
        let planetViewModel = PlanetViewModel(planet: planet)
        
        // what is it that we want to test?
        XCTAssertEqual(result.name, planetViewModel.name)

    }
    
   

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
