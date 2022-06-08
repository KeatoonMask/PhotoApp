//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Serafín Ennes Moscoso on 3/1/22.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "First Name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last Name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
    }
    
    
    func testViewController_WhenInvalidadFormSubmitted_PresentsErrorAlertDialog() {
        
        firstName.tap()
        firstName.typeText("Finsi")
            
        lastName.tap()
        lastName.typeText("Ennes")
        
        email.tap()
        email.typeText("finsi@gmail.com")
        
        password.tap()
        password.typeText("1234abcd")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
                
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1))
    }
    
    func testViewController_WhenValidadFormSubmitted_PresentsErrorAlertDialog() {
        
        firstName.tap()
        firstName.typeText("Finsi")
            
        lastName.tap()
        lastName.typeText("Ennes")
        
        email.tap()
        email.typeText("finsi@gmail.com")
        
        password.tap()
        password.typeText("1234abcd")
        
        repeatPassword.tap()
        repeatPassword.typeText("1234abcd")
                
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1))
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
