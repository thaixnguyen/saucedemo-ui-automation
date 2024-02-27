//
//  Utils.swift
//  saucedemo-ui-automation
//
//  Created by Thai Nguyen on 2024-02-26.
//

import Foundation
import XCTest

class Utils {
    private var baseScreen = BaseScreen()
    lazy var app = baseScreen.app

    private lazy var notNow = app.buttons[TestIDs.notNowID]
    private lazy var continueButtonKeyboard = app.buttons[TestIDs.continueButtonID]
    private lazy var goButtonKeyboard = app.buttons[TestIDs.goID]

    // Helper function to hide the keyboard when needed
    func hideKeyboard() {
        if app.keyboards.element(boundBy: 0).exists {
            if UIDevice.current.userInterfaceIdiom == .pad {
                app.keyboards.buttons[TestIDs.hideKeyboardID].tap()
            } else {
                app.toolbars.buttons[TestIDs.doneKeyboardID].tap()
            }
        }
    }

    // Helper function to dismiss the keyboard tutorial.
    // Source: https://stackoverflow.com/a/70185587
    func dismissKeyboardTutorialIfNeeded() {
        let predicate = NSPredicate { (evaluatedObject, _) in
            return (evaluatedObject as? XCUIElementAttributes)?.identifier == TestIDs.tutorialKeyboardID
        }
        let keyboardTutorialView = app.windows.otherElements.element(matching: predicate)
        if keyboardTutorialView.exists {
            keyboardTutorialView.buttons[TestIDs.continueButtonID].tap()
        }
    }
}
