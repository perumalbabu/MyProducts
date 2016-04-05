//
//  MyProductsTests.swift
//  MyProductsTests
//
//  Created by Perumal babu Valiveri veeraperumal on 3/11/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import XCTest
@testable import MyProducts

class MyProductsTests: XCTestCase {
    
    var jsonFeed = ""
    
    override func setUp() {
        super.setUp()
        jsonFeed = ""
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let data = jsonFeed.dataUsingEncoding(NSUTF8StringEncoding)
        let productInformation = ServiceManager.sharedInstance.parseResponse(data)
        XCTAssertEqual(productInformation.count, 1)
     }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
