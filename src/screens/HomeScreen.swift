//
//  HomeScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class HomeScreen: BaseScreen {
    private lazy var defaultSort = app.otherElements[TestIDs.alphabeticalSortID]
    private lazy var firstSort = app.buttons[TestIDs.alphabeticalSortID]
    private lazy var secondSort = app.buttons[TestIDs.reverseAlphabeticSortID]
    private lazy var thirdSort = app.buttons[TestIDs.priceLowestToHighestID]
    private lazy var forthSort = app.buttons[TestIDs.priceHighestToLowestID]
    private lazy var addtoCartQuery = app.buttons.matching(identifier: TestIDs.addToCartID)

    // A function that adds items to the cart.
    // Since Add To Cart was not a unique ID,
    // the workaround to add an item to the cart
    // was to iterate through the number of items
    // we expect to add to the cart and then just
    // add it to the cart starting from the first
    // item on the page.
    func addToCart(numberOfItems: Int) {
        for _ in 1...numberOfItems {
            addtoCartQuery.element(boundBy: 0).tap()
        }
    }

    // An function that clicks on the cart, there
    // wasn't a good ID to use. Noticed that
    // the number of items in the cart was a
    // good candidate which is what was used here.
    func clickOnCart(numberOfItems: String) {
        let cart = app.staticTexts[numberOfItems]
        cart.tap()
    }

    // Clicks on the sort button and clicks
    // on the highest to lowest button for sorting.
    func sortFromHighestToLowest() {
        defaultSort.tap()
        forthSort.tap()
    }

    // A helper function that checks if the number of items
    // in the cart is accurate e.g. if you pass in 3, it checks
    // if there are 3 items in the cart.
    func checkNumberOfItemsInCart(numberOfItems: String) -> Bool {
        let cart = app.staticTexts[numberOfItems]
        return cart.exists
    }
}
