//
//  login_page.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class LoginScreen: BaseScreen {
    private lazy var usernameTextField = app.textFields[TestIDs.usernameID]
    private lazy var passwordSecureTextField = app.secureTextFields[TestIDs.passwordID]
    private lazy var loginButton = app.buttons[TestIDs.loginID]
    private lazy var notNow = app.buttons[TestIDs.notNowID]
    private lazy var lockedUserCheck = app.staticTexts[TestIDs.lockedUserErrorID]

    func logIntoApp(username: String, password: String) {
        usernameTextField.tap()
        usernameTextField.typeText(username)

        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)

        loginButton.tap()

        // Check is here for locked user
        // since they will not be able to
        // log in, so we check if the element
        // exists before tapping not now for
        // a successful login
        if notNow.exists {
            notNow.tap()
        }
    }

    func checkLockedUser() -> Bool {
        return lockedUserCheck.exists
    }
}
