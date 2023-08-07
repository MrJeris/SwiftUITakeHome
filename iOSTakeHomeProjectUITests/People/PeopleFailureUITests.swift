//
//  PeopleFailureUITests.swift
//  iOSTakeHomeProjectUITests
//
//  Created by Ruslan Magomedov on 07.08.2023.
//

import XCTest

final class PeopleFailureUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"0"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_alert_is_shown_when_screen_fails_to_loads() {
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 3), "There should be an alert on te screen")
        
        XCTAssertTrue(alert.staticTexts["URL isn't valid"].exists)
        XCTAssertTrue(alert.buttons["Retry"].exists)
    }
}
