//
//  CheckoutScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class CheckoutScreen: BaseScreen {
    private lazy var continueShopping = app.buttons[TestIDs.backtoHomeScreenID]
    private lazy var checkOut = app.buttons[TestIDs.checkoutID]
    private lazy var secondSort = app.buttons[TestIDs.reverseAlphabeticSortID]
    private lazy var thirdSort = app.buttons[TestIDs.priceLowestToHighestID]
    private lazy var forthSort = app.buttons[TestIDs.priceHighestToLowestID]
    private lazy var addtoCartQuery = app.buttons.matching(identifier: TestIDs.addToCartID)

    func clickCheckout() {
        checkOut.tap()
    }

    func clickBack() {
        continueShopping.tap()
    }
}
