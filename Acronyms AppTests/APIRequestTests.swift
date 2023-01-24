//
//  APIRequestTests.swift
//  Acronyms App
//
//  Created by chamuel castillo on 1/23/23.
//

import XCTest
@testable import Acronyms_App

final class APIRequestTests: XCTestCase {
    var sut: APIRequest!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        sut = APIRequest()
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_APIRequest_return_empty_array() async throws {
        let expectedArray = try await self.sut.fetch(searchTerm: "")
        XCTAssertTrue(expectedArray.isEmpty)
    }
    
    func test_APIRequest_return_filled_array() async throws {
        let expectedArray = try await self.sut.fetch(searchTerm: "HMM")
        XCTAssertFalse(expectedArray.isEmpty)
    }
    
}
