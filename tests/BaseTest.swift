//
//  BaseTest.swift
//  tests
//
//  Created by Thai Nguyen on 2024-02-26.
//

import Foundation
import XCTest

open class BaseTest: XCTestCase {
    private lazy var URLField = app.textFields[TestIDs.urlID]
    private lazy var goButtonKeyboard = app.buttons[TestIDs.goID]

    private var baseScreen = BaseScreen()
    lazy var app = baseScreen.app

    // Initialize all the screens and helpers for test setup
    let loginScreen = LoginScreen()
    let navSideBarScreen = SideNavScreen()
    let homeScreen = HomeScreen()
    let checkOutScreen = CheckoutScreen()
    let checkOutInfoScreen = CheckoutInfoScreen()
    let checkOutOverviewScreen = CheckoutOverviewScreen()
    let checkOutCompleteScreen = CheckoutCompleteScreen()
    let assistUtils = Utils()

    open override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        URLField.tap()

        // On clean startup, checks for the Keyboard tutorial and bypasses it if it shows up.
        assistUtils.dismissKeyboardTutorialIfNeeded()

        app.typeText(URL.sauceDemoURL)
        goButtonKeyboard.tap()
    }

    open override func tearDownWithError() throws {
        app.terminate()
    }
}
