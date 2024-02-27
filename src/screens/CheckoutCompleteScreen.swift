//
//  CheckoutCompleteScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class CheckoutCompleteScreen: BaseScreen {
    private lazy var checkoutComplete = app.staticTexts[TestIDs.checkOutCompleteID]

    func checkOutSuccessful() -> Bool {
        return checkoutComplete.exists
    }
}
