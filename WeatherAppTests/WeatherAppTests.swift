//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Burhanuddin Shakir on 18/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import XCTest

class WeatherAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTempInDegrees(){
        XCTAssert(getTempInDegrees(temp: 273.15) == 0.0)
        XCTAssert(getTempInDegrees(temp: 287.35 ) == 14.0)
        XCTAssert(getTempInDegrees(temp: 288.05 ) == 15.0)
    }
    
    func testGetDate(){
//        XCTAssert(getDate(dt: 1516319385) == "Today, January 18, 2018") //will fail if tested on another date
        XCTAssert(getDate(dt: 1485741600) == "Monday, January 30, 2017")
    }
    
    func testGetDay(){
        XCTAssert(getDay(dt: 1486519200) == "Wednesday")
        XCTAssert(getDay(dt: 820886400) == "Saturday")
    }
    
}
