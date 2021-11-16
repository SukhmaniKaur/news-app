//
//  NewsHomePageUITests.swift
//  NewAppUITests
//
//  Created by MACBOOK on 16/11/21.
//

import XCTest

class NewsHomePageUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTableViewScrollInHomeScreen() throws {
        let app = XCUIApplication()
        let tableView = app.homeTableView
        sleep(5)
        XCTAssertTrue(tableView.cells.count != 0, "Products Exists")
        let first = tableView.children(matching:.any).element(boundBy: 0)
        let last = tableView.children(matching:.any).element(boundBy: tableView.cells.count - 1)
        tableView.swipeUp()
        tableView.swipeUp()
        sleep(2)
        XCTAssertTrue(first.exists, "We are at top")
        first.tap()
        sleep(5)
        app.navigationBars["NewApp.NewsDetailVC"].buttons["Tech Crunch"].tap()
        tableView.swipeUp()
        tableView.swipeUp()
        sleep(2)
        XCTAssertTrue(last.exists, "We are at bottom")
        last.tap()
        sleep(5)
    }
}

extension XCUIApplication {
    var homeTableView: XCUIElement { self.tables["TableView"] }
    var tableViewCell: XCUIElement{ self.homeTableView.cells.element(boundBy: 0) }
}
