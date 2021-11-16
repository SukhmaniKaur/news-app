//
//  NetworkingTests.swift
//  NewAppTests
//
//  Created by MACBOOK on 15/11/21.
//

import XCTest
@testable import NewApp

class NetworkingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testInternetConnection() throws {
        if !APIManager.isConnectedToNetwork() {
            XCTAssertFalse(APIManager.isConnectedToNetwork())
        } else {
            XCTAssertTrue(APIManager.isConnectedToNetwork())
        }
    }
    
    func testApiResponseIsNotNil() throws {
        let exp = self.expectation(description: "ApiResponseIsNotNil")
        APIManager.sharedInstance.I_AM_COOL_GET(params: [String : Any](), api: API.BASE_URL, Loader: false, isMultipart: false) { (response) in
                XCTAssertNotNil(response, "Response of the api is not nil")
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 5, handler: nil)
    }

}
