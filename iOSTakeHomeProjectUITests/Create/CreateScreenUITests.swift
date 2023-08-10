//
//  CreateScreenUITests.swift
//  iOSTakeHomeProjectUITests
//
//  Created by Ruslan Magomedov on 10.08.2023.
//

import XCTest

final class CreateScreenUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = [
            "-people-networking-success":"1",
            "-create-networking-success":"1"
        ]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_valid_form_submission_is_successful() {
        
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        
        let firstNameTextField = app.textFields["firstNameTextField"]
        let lastNameTextField = app.textFields["lastNameTextField"]
        let jobTextField = app.textFields["jobTextField"]
        
        firstNameTextField.tap()
        firstNameTextField.typeText("Ruslan")
        
        lastNameTextField.tap()
        lastNameTextField.typeText("Magomedov")
        
        jobTextField.tap()
        jobTextField.typeText("iOS Developer")
        
        
        let submitBtn = app.buttons["submitBtn"]
        XCTAssertTrue(submitBtn.exists, "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        XCTAssertTrue(app.navigationBars["People"].waitForExistence(timeout: 5), "There should be a navigation bar title People")
    }
}
