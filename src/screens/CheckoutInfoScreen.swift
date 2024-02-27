//
//  CheckoutPurchaseScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class CheckoutInfoScreen: BaseScreen {
    private lazy var continueButton = app.buttons[TestIDs.continueButtonID]
    private lazy var cancelButton = app.buttons[TestIDs.cancelID]
    private lazy var firstNameField = app.textFields[TestIDs.firstNameID]
    private lazy var lastNameField = app.textFields[TestIDs.lastNameID]
    private lazy var zipCodeField = app.textFields[TestIDs.zipCodeID]
    private lazy var lastNameRequired = app.staticTexts[TestIDs.lastNameErrorID]

    func fillCheckout(firstName: String, lastName: String, zipCode: String) {
        firstNameField.tap()
        firstNameField.typeText(firstName)

        lastNameField.tap()
        lastNameField.typeText(lastName)

        zipCodeField.tap()
        zipCodeField.typeText(zipCode)
    }

    func clickContinue() {
        continueButton.tap()
    }

    func clickCancel() {
        cancelButton.tap()
    }

    func validateLastNameErrorMessage() -> Bool {
        return lastNameRequired.exists
    }
}
