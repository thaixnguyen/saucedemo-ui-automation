//
//  CheckOutOverviewScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class CheckoutOverviewScreen: BaseScreen {
    private lazy var finishButton = app.buttons[TestIDs.finishID]
    private lazy var cancelButton = app.buttons[TestIDs.cancelID]

    func clickFinish() {
        // Some emulators were running into issues trying to
        // tap on the finish button on the checkout page, so
        // to prevent this, we do a swipe up so the element is
        // is visible before the tap happens.
        app.swipeUp()
        finishButton.tap()
    }

    func clickCancel() {
        cancelButton.tap()
    }
}
