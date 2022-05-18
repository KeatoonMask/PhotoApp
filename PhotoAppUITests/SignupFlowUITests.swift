//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Serafín Ennes Moscoso on 3/1/22.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
 
        let firstName = app.textFields["firstNameTextField"]
        let lastName = app.textFields["lastNameTextField"]
        let email = app.textFields["emailTextField"]
        let password = app.secureTextFields["passwordTextField"]
        let repeatePassword = app.secureTextFields["repeatPasswordTextField"]
        let signupButton = app.buttons["signupButton"]
        
        XCTAssertTrue(firstName.isEnabled, "First Name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last Name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatePassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
    }
    
    func testViewController_WhenInvalidadFormSubmitted_PresentsErrorAlertDialog() {
        // Arrage
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["firstNameTextField"]
        firstName.tap()
        firstName.typeText("Finsi")
            
        let lastName = app.textFields["lastNameTextField"]
        lastName.tap()
        lastName.typeText("Ennes")
        
        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("finsi@gmail.com")
        
        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("1234abcd")
        
        let repeatePassword = app.secureTextFields["repeatPasswordTextField"]
        repeatePassword.tap()
        repeatePassword.typeText("123")
        
        let signupButton = app.buttons["signupButton"]
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
